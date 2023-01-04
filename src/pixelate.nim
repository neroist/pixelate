import std/os

import spinny
import cligen
import pixie

proc main(file: string, size: int = 256, outFile: string = "") =
  ## Pixelate image

  let outFilePath = if outFile == "": getCurrentDir() / file.splitFile().name & "_pixelated.png"
                    else: outFile

  var spinner = newSpinny("Pixelating " & file.extractFilename, skDots)

  spinner.setSymbolColor(fgBlue)
  spinner.start()
    
  try:
    var image = readImage(file)
    let imgSize = (image.width, image.height)

    image = image.resize(size, size)

    if not dirExists(outFilePath.parentDir): createDir(outFilePath.parentDir)
    image.resize(imgSize[0], imgSize[1]).writeFile(outFilePath)
  except:
    spinner.error("Failed to pixelate image. Error: " & getCurrentExceptionMsg())
    return

  spinner.success("Successfully pixelated image!")

dispatch(
  main, 
  help = {
    "file": "The file to pixelate",
    "size": "How many pixels to pixelate to",
    "outFile": "The filename of the pixelated image created"
  }
)
