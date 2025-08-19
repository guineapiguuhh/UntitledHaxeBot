import hxdiscord.types.Message;

interface Command {
    public var name: String;

    public function run(m: Message, args: Args): Void;
    public function help(): String;
}