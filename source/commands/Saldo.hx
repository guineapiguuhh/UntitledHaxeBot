package commands;

import hxdiscord.types.Message;

class Saldo implements Command {
    public var name: String = "saldo";

    public function new() {}

    public function run(m: Message, args: Args): Void {
        PixManager.initUsers(m.author.id);
        PixManager.save();
        
        m.reply({
            content: 'Seu saldo: R$ ${PixManager.get(m.author.id)}'
        }, true);
    }

    public function help(): String {
        return "";
    }
}