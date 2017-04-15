port module Stylesheets exposing (..)

import Css.File exposing (..)
import PomodoroCss as Pomodoro

port files : CssFileStructure -> Cmd msg

cssFiles : CssFileStructure
cssFiles =
  toFileStructure [ ("pomodoro.css", compile [ Pomodoro.css])]

main : CssCompilerProgram
main =
  Css.File.compiler files cssFiles
