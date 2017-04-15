module Util exposing (..)

paddValue : String -> String
paddValue value =
  if String.length value == 1 then
    "0" ++ value
  else
    value
