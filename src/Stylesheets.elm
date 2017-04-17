port module Stylesheets exposing (..)

import Css.File exposing (..)
import PomodoroCss

port files : CssFileStructure -> Cmd msg

cssFiles : CssFileStructure
cssFiles =
  toFileStructure [ ("pomodoro.css", compile [ PomodoroCss.css])]

main : CssCompilerProgram
main =
  Css.File.compiler files cssFiles
