package utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class GetDateTime {

	public static String addDaysToDate_yyyymmdd(int addDays) {

		String DATE_FORMAT = "yyyyMMdd";
	    SimpleDateFormat sdf =
	    new SimpleDateFormat(DATE_FORMAT);
	    Calendar dtCalendar = Calendar.getInstance(); // today	   	    	    
	    dtCalendar.add(Calendar.DATE, addDays);
	    //return sdf.format(c1.getTime());

	    return sdf.format(dtCalendar.getTime());
		
	}
		
}
