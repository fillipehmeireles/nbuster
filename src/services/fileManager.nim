import streams
import os
import options
import memfiles

type
    Result = tuple
        stream: Stream
        nLines: int
        error: Option[string]

proc openWordList*(wordlistPath: string): Result =
    if not fileExists(wordlistPath):
        return (nil, 0,some("Error on opening file"))
    var lineCounter: int
    for l in memSlices(memfiles.open(wordlistPath)):
        inc(lineCounter)
    let fStream = newFileStream(wordlistPath, fmRead)
    if isNil(fStream):
        return (nil, 0,some("Error on opening stream: Stream is nil"))
    result = (fStream, lineCounter, none(string))
