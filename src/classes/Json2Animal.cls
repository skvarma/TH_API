public class Json2Animal {

    public Animal animal;

    public class Animal {
        public Integer id;
        public String name;
        public String eats;
        public String says;
    }


    public static Json2Animal parse(String json) {
        return (Json2Animal) System.JSON.deserialize(json, Json2Animal.class);
    }
}