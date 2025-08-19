import commands.*;
import hxdiscord.utils.Intents;
import dotenv.DotEnv;

class Main {
    public static var Bot: CommandClient;

    static function main() {
        DotEnv.load();

        Bot = new CommandClient(Sys.getEnv("TOKEN"), [Intents.ALL], false);
        Bot.onReady = onReady;
        Bot.setCommands([
            new TwentyTao(),
            new Exemple(),
            new Say(),
            new Saldo(),
            new Mandar(),
            new Version()
        ]);
        Bot.connect();
    }

    public static function onReady() {
        Sys.println('Name: ${Bot.username}\nDiscriminator: ${Bot.user.discriminator}\nId: ${Bot.user.id}');
        PixManager.init();
    }
}