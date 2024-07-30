package com.BaiTapLab.HomeController;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

public class TimeZoneUtil {
	private static final Map<String, String> languageToTimeZoneMap = new HashMap<>();

    static {
        languageToTimeZoneMap.put("vi", "Asia/Ho_Chi_Minh");
        languageToTimeZoneMap.put("en", "America/New_York");
        languageToTimeZoneMap.put("zh", "Asia/Shanghai");
        languageToTimeZoneMap.put("th", "Asia/Bangkok");
    }

    public static TimeZone getTimeZone(Locale locale) {
        String timeZoneId = languageToTimeZoneMap.get(locale.getLanguage());
        return timeZoneId != null ? TimeZone.getTimeZone(timeZoneId) : TimeZone.getDefault();
    }
}
