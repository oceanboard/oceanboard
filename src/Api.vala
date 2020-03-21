public class Api {
    private const string MAIN_WEATHER_KEY = "main";
    private const string MAIN_TEMP_KEY = "temp";
    private static Json.Node parse_json (string data) {
        Json.Parser parser = new Json.Parser ();
        Json.Node ret_val = new Json.Node (Json.NodeType.NULL);
        try {
            parser.load_from_data (data);
            ret_val = parser.get_root();
            return ret_val;
        } catch (Error e) {
            print ("Error: %s\n", e.message);
            return ret_val;
        }
    }

    private static string fetch_to_string (string url) {
        Soup.Session session = new Soup.Session ();
        Soup.Logger logger = new Soup.Logger (Soup.LoggerLogLevel.MINIMAL, -1);
        Soup.Message msg = new Soup.Message ("GET", url);
        session.add_feature (logger);
        session.send_message (msg);
        if(msg.status_code == 200) {
            return (string) msg.response_body.data;
        } else {
            return "";
        }
    }

    private static Json.Node fetch (string url) {
        return parse_json (fetch_to_string (url));
    }

    public static Json.Node weather_by_query (string keyword) {
        return fetch(@"http://api.openweathermap.org/data/2.5/weather?q=$keyword&appid=c442835085b1b44e5f24c2702797b2bb");
    }

    public static int get_temp (Json.Node node) {
        Json.Object obj = node.get_object ();
            
        Json.Node weather_main = obj.get_member (MAIN_WEATHER_KEY);
        Json.Object weather_main_obj = weather_main.get_object ();
            
        Json.Node main_temp = weather_main_obj.get_member (MAIN_TEMP_KEY);
        return (int) ( ( ( main_temp.get_int () - 273 ) * 1.8 ) + 32);
    }
}