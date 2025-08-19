package commands;

import hxdiscord.types.Message;

// TODO: Make a pull request to fix the attachments

class Say implements Command {
    public var name: String = "say";

    public function new() {}

    public function run(m: Message, args: Args): Void {
        m.reply({
            content: args.get(0),
        }, false);
    }

    public function help(): String {
        return "";
    }
}