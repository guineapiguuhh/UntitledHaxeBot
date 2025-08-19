package commands;

import hxdiscord.types.Message;

class TwentyTao implements Command {
    public static final gamebananaLink = "https://gamebanana.com/mods/602533";
    public static final gamejoltLink = "https://gamejolt.com/games/20taodemo/1002205";
    public static final twitterLink = "https://x.com/20taonopix";
    public static final githubLink = "https://github.com/JDanielRandomizer/20tao-patch-demo";

    public var name: String = "20tao";

    public function new() {}

    public function run(m: Message, args: Args): Void {
        m.reply({
            content: 'GameBanana: ${gamebananaLink}\nGameJolt: ${gamejoltLink}\nTwitter: ${twitterLink}\nGitHub: ${githubLink}'
        }, true);
    }

    public function help(): String {
        return "";
    }
}