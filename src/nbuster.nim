import cli/cli
from services/fileManager import openWordList
from services/httpcli import makeGetRequest

import options
import streams
import httpclient

when isMainModule:
  var args = cli()
  if not args.isSome:
    quit(1)
  let argOptions = args.get()
  var fStream = openWordList(argOptions.wordlistPath)
  if fStream.error.isSome:
    echo fStream.error.get()
    quit(1)
  var line: string
  var lineCounter:int
  echo "\t\t\t","endpoint","\t\t", "status code", "\t\t\t", "words"
  while fStream.stream.readLine(line):
    inc(lineCounter)
    var targetUrl = argOptions.url & line
    var response = makeGetRequest(targetUrl)
    echo lineCounter, "/", fStream.nLines,"\t\t\t", line , "\t\t\t", response.status, "\t\t\t", response.chars

  fStream.stream.close()


