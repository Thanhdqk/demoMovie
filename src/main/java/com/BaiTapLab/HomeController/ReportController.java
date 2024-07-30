package com.BaiTapLab.HomeController;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;
import org.springframework.http.HttpHeaders;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.BaiTapLab.Entity.HoaDon;
import com.BaiTapLab.Entity.User;
import com.BaiTapLab.Service.ReportService;

@Controller
public class ReportController {

    @Autowired
    private ReportService reportService;
    
    @GetMapping("/report")
    public ResponseEntity<byte[]> generateReport() throws IOException {
        List<User> users = reportService.getAllUsers();
        List<HoaDon> hoaDons = reportService.getAllHoaDons();

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Report");

        int rowNum = 0;
        long totalAmount = 0; // Biến để lưu tổng giá trị thanhTien

        // Header
        Row headerRow = sheet.createRow(rowNum++);
        headerRow.createCell(0).setCellValue("User ID");
        headerRow.createCell(1).setCellValue("Username");
        headerRow.createCell(2).setCellValue("Email");
        headerRow.createCell(3).setCellValue("Order ID");
        headerRow.createCell(4).setCellValue("Order Amount");
        headerRow.createCell(5).setCellValue("Order Method");

        // Data
        for (User user : users) {
            for (HoaDon hoaDon : user.getHoadons()) {
                Row row = sheet.createRow(rowNum++);
                row.createCell(0).setCellValue(user.getId());
                row.createCell(1).setCellValue(user.getUsername());
                row.createCell(2).setCellValue(user.getEmail());
                row.createCell(3).setCellValue(hoaDon.getMaHD());
                row.createCell(4).setCellValue(hoaDon.getThanhTien());
                row.createCell(5).setCellValue(hoaDon.getPhuongThucTT());
                totalAmount += hoaDon.getThanhTien(); // Cộng dồn thanhTien vào biến tổng
            }
        }

        Row totalRow = sheet.createRow(rowNum++);
        totalRow.createCell(5).setCellValue("Total");
        totalRow.createCell(6).setCellValue(totalAmount);

        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        workbook.write(bos);
        workbook.close();

        byte[] excelBytes = bos.toByteArray();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attachment; filename=report.xlsx");

        return ResponseEntity
                .ok()
                .headers(headers)
                .body(excelBytes);
    }
}