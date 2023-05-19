package api.runners;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
//run() method required path to feature file.
//you can use tags()method to specify the tags.	
	
	@Karate.Test
	public Karate runTest() {

		return Karate.run("classpath:Features")
				.tags("Regression");
		

	}
}
