@IsTest
public class JSON2Animal_Test {

    static testMethod void testParse() {
        String json = '{\"animal\":{\"id\":2,\"name\":\"bear\",\"eats\":\"berries, campers, adam seligman\",\"says\":\"yum yum\"}}';
        Json2Animal obj = Json2Animal.parse(json);
        System.assert(obj != null);
    }
}