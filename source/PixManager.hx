import hxdiscord.types.User;
import sys.FileSystem;
import sys.io.File;

class PixManager {
    public static var xml: Xml;
    public static var bankPath: String = 'bank.xml';

    public static var initMoney: Int = 50_00;

    public static function init() {
        if (FileSystem.exists(bankPath)) {
            var content = File.getContent(bankPath);
            xml = Xml.parse(content).firstElement();

            return;
        }

        xml = Xml.createElement('bank');
        save();
    }

    public static function initUsers(...ids: String) {
        for (id in ids) {
            if (!exists(id)) {
                set(id, initMoney);
            }
        }
    }

    public static function save() {
        File.saveContent(bankPath, xml.toString());
    }

    public static function transfer(from: String, money: Int, to: String) {
        money = Std.int(Math.max(money, 0));
        set(from, get(from) - money);
        set(to, get(to) + money);
    }

    public static function exists(id: String) {
        for (element in xml.elementsNamed("user")) {
            if (element.get("id") == id)
                return true;
        }
        return false;
    }
    
    public static function set(id: String, money: Int) {
        money = Std.int(Math.max(money, 0));

        if (!exists(id)) {
            var user = Xml.createElement("user");
            user.set("id", id);
            user.set("money", '${money}');
            xml.addChild(user);
            return;
        }

        for (element in xml.elementsNamed("user")) {
            if (element.get("id") == id)
                element.set("money", '${money}');
        }
    }

    public static function get(id: String): Int {
        for (element in xml.elementsNamed("user")) {
            if (element.get("id") == id)
                return Std.parseInt(element.get("money"));
        }
        return 0;
    }
}