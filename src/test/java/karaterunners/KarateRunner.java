package karaterunners;

import com.intuit.karate.junit5.Karate;

class KarateRunner {
    
    @Karate.Test
	Karate testSample() {
	  return Karate.run("sample").relativeTo(getClass());
	}
    
    @Karate.Test
	Karate testTags() {
	   return Karate.run("tags").tags("@second").relativeTo(getClass());
	}

    @Karate.Test
    Karate testSystemProperty() {
        return Karate.run("classpath:com/tests/tags.feature")
                .tags("@tag1")
                .karateEnv("e2e")
                .systemProperty("foo", "bar");
    }

}