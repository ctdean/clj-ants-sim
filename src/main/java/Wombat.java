import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Wombat {
    final Logger logger = LoggerFactory.getLogger(Wombat.class);
    Integer t;
    Integer oldT;

    public void setTemperature(Integer temperature) {
   
        oldT = t;        
        t = temperature;

        logger.debug("Temperature set to {}. Old temperature was {}.", t, cost());

        if(temperature.intValue() > 50) {
            logger.info("Temperature has risen above 50 degrees. {}", cost());
        }
    }

    String cost() {
        System.err.println( "--- in cost" );
        return( "a lot" );
    }

    static public void main( String args[] ) {
        System.err.println( "start" );
        new Wombat().setTemperature( 100 );
    }
} 
