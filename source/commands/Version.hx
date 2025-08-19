package commands;

import sys.io.Process;
import hxdiscord.types.Message;

class Version implements Command {
    public var name: String = "version";

    public function new() {}

    public function run(m: Message, args: Args): Void {
        var git_hash: String = new Process("git", ["rev-parse", "HEAD"])
            .stdout
            .readString(0);

        var haxe: String = new Process("haxe", ["--version"])
            .stdout
            .readString(0);

        m.reply({
            content: 'Git Hash: ${git_hash}\nHaxe: ${haxe}'
        }, false);
    }

    public function help(): String {
        return "";
    }
}