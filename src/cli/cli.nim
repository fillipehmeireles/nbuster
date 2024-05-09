import parseopt
import options
import os

type
    ArgOptions* = object
        url*: string
        wordlistPath*: string

proc cli*(): Option[ArgOptions] =
    if paramCount() == 0:
        echo "Please provide arguments"
        return none(ArgOptions)
    var
        url: string
        wordlistPath: string
    for kind,key,value in getOpt():
        case kind:
        of cmdArgument:
            discard
        of cmdLongOption, cmdShortOption:
            case key:
            of "h", "help":
                echo "help!"
            of "u", "url":
                url = value
                if value[^1] != '/':
                    url.add("/")
            of "w", "wordlist":
                wordlistPath = value
            else:
                echo "Unknown option: ", key
                return none(ArgOptions)
        of cmdEnd:
            discard
    result = some(ArgOptions(url: url, wordlistPath: wordlistPath))