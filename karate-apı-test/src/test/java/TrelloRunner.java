import com.intuit.karate.junit5.Karate;

import java.nio.file.Path;
import java.nio.file.Paths;


public class TrelloRunner {
    @Karate.Test
    Karate testTrelloAPI() {
        return Karate.run("classpath:/create_board.feature");


    }
}
