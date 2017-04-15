module Update exposing (..)

import Msgs exposing (Msg)
import Models exposing (Model, initialModel)
import Constants
import Time exposing (second)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Msgs.Tick time ->
      if model.counting then
        let
          elapsed = model.elapsed + second
          newModel = { model | elapsed = elapsed }
        in
          ( newModel, Cmd.none )
      else
        ( model, Cmd.none )

    Msgs.StartWork ->
      ( startTimer Constants.codeTime Msgs.Work, Cmd.none )

    Msgs.StartCoffee ->
      ( startTimer Constants.coffeeTime Msgs.Coffee, Cmd.none )

    Msgs.StartSocial ->
      ( startTimer Constants.socialTime Msgs.Social, Cmd.none )

    Msgs.Play ->
      ( { model | counting = True }, Cmd.none )

    Msgs.Pause ->
      ( { model | counting = False }, Cmd.none)

startTimer : Float -> Msgs.Modes -> Model
startTimer timer mode =
  { initialModel
  | timer = timer
  , counting = True
  , currentMode = mode
  }
