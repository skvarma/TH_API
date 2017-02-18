@IsTest
public class JSON2Animal_Test {

    static testMethod void testParse() {
        String json = '{\"animal\":{\"id\":2,\"name\":\"bear\",\"eats\":\"berries, campers, adam seligman\",\"says\":\"yum yum\"}}';
        JSON2Apex obj = JSON2Apex.parse(json);
        System.assert(obj != null);
    }
}