import hxdiscord.types.Message;
import hxdiscord.DiscordClient;

using StringTools;

class CommandClient extends DiscordClient {
    public var prefix: String = "&";

    public var commands: Map<String, Command> = [];

    public function setCommands(commands: Array<Command>) {
        for (command in commands)
            this.commands.set(prefix + command.name, command);
    }

    override function onMessageCreate(m:Message) {
        var args: Args = Args.parse(m.content);

        var commandName = args.get(0);
        if (commands.exists(commandName))
        {
            var commandArgs: Args = args.copy();
            if (commandArgs.length > 0)
                commandArgs.removeAt(0);
            commands.get(commandName).run(m, commandArgs);
        }
    }
}