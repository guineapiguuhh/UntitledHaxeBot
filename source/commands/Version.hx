package commands;

import sys.io.Process;
import hxdiscord.types.Message;

class Version implements Command {
    public var name: String = "version";

    public function new() {}

    public function run(m: Message, args: Args): Void {
        var git_hash: String = new Process("git", ["rev-parse", "HEAD"])
            .stdout
            .readLine();

        var haxe: String = new Process("haxe", ["--version"])
            .stdout
            .readLine();

        m.reply({
            content: 'Git Hash: ${git_hash}\nHaxe: ${haxe}'
        }, false);
    }

    public function help(): String {
        return "";
    }
}