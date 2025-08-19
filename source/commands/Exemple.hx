package commands;

import hxdiscord.types.Message;

class Exemple implements Command {
    public var name: String = "exemple";

    public function new() {}

    public function run(m: Message, args: Args): Void {
        m.reply({
            content: 'Este é um comando de exemplo...'
        }, false);
    }

    public function help(): String {
        return "";
    }
}