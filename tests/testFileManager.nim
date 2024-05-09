import unittest2
import streams, options
from ../src/services/fileManager import openWordList


suite "Test File Manager Service":
    test "Test Read File":
        var
            dirs: seq[string] = @[]
        var fStream = openWordList("demo/wordlist-demo.txt")
        assert not fStream.error.isSome
        var line: string
        while fStream.stream.readLine(line):
            dirs.add(line)
        fStream.stream.close()
        assert @["admin","login","robots.txt"] == dirs

        