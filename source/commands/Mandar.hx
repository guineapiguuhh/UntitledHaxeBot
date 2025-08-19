package commands;

import hxdiscord.endpoints.Endpoints;
import hxdiscord.types.User;
import hxdiscord.types.Message;

using StringTools;

class Mandar implements Command {
    public var name: String = "mandar";

    public function new() {}

    public function run(m: Message, args: Args): Void {
        var value: Int = Std.parseInt(args.get(0));
        var id: String = args.get(1)
            .replace("<", "")
            .replace("@", "")
            .replace(">", "");
        var u: User = Endpoints.getUser(id);

        PixManager.initUsers(u.id, m.author.id);
        PixManager.transfer(m.author.id, value, u.id);
        PixManager.save();

        m.reply({
            content: 'Você mandou R$ ${value} para ${id}>'
        }, true);
    }

    public function help(): String {
        return "";
    }
}