package karaterunners;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class ParallelTest {

	//Runner for JUnit 4 Parallel Execution
    @Test
    void testParallel() {
        Results results = Runner.path("classpath:").tags("@SimpleCreatePet").parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
      	
    }
    
}
