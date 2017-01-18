package factory;

import model.TestModel;
import sun.rmi.runtime.Log;

import java.util.Arrays;
import java.util.List;

/**
 * Created by yurijs on 10.01.2017.
 */
public class TestFactory {
    private static TestFactory testFactory;
    private TestModel testModel = new TestModel();
    Logger logger = new Logger();

    private TestFactory(){}

    public static TestFactory getTestFactoryInstance(){
        if (testFactory == null){
            testFactory = new TestFactory();
        }
        return testFactory;
    }

    public void isToDoTestIncrement(String request){
        List<String> list = Arrays.asList(request.split(" "));
        for (String s:list){
            if(s.equalsIgnoreCase("doTestIncrement"))
                incrementModelsFields();
            if(s.equalsIgnoreCase("doTestObjectNull"))
                nullTheObject();
        }
    }

    private void incrementModelsFields(){
        logger.writeToLog("[TestFactory] - test filed_1: " + testModel.field_01 + ", and field_02: "+ testModel.field_02);
        testModel.field_01 ++;
        testModel.field_02 ++;
        logger.writeToLog("[TestFactory] - Test Model was incremented");
        logger.writeToLog("[TestFactory] - test filed_1: " + testModel.field_01 + ", and field_02: "+ testModel.field_02);
    }

    private void nullTheObject(){
        testFactory = null;
    }
}
