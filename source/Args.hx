import haxe.macro.Context;
import haxe.macro.Expr;

using StringTools;

class Args {
    public var members: Array<String> = [];
    public var length(get, never): Int;

    public function new() {}

    public function get_length(): Int {
        return members.length;
    }

    public function get(index: Int): String {
        return members[index];
    }

    public function remove(x: String): Bool {
        return members.remove(x);
    }

    public function removeAt(index: Int): Bool {
        return members.remove(members[index]);
    }

    public function copy(): Args {
        var argsCopy: Args = new Args();
        argsCopy.members = members;

        return argsCopy;
    }

    public static function parse(content: String): Args {
        var args: Args = new Args();

        var value: String = '';
        var inQuotes: Bool = false;
        for (i in 0...content.length) {
            var char: String = content.charAt(i);

            switch (char) {
                case '\'' | '\"':
                    inQuotes = !inQuotes;
                case ' ':
                    if (inQuotes) {
                        value += char;
                        continue;
                    }
                    args.members.push(value);
                    value = '';

                default:
                    value += char;
            }
        }

        if (value != '')
            args.members.push(value);
        return args;
    }
}