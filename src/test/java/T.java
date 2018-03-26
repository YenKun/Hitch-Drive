import java.time.ZoneId;
import java.util.Calendar;
import java.util.Locale;
import java.util.Set;
import java.util.TimeZone;

public class T {
	public static void main(String[] args) {
		Set<String> ids = ZoneId.getAvailableZoneIds();
		System.out.println(ids);
		long jst = Calendar.getInstance(TimeZone.getTimeZone(ZoneId.of("America/Cuiaba")), Locale.US).getTimeInMillis();
		long tw = System.currentTimeMillis();
		System.out.println("jst" + jst);
		System.out.println("tw" + tw);
	}
}
