"use strict"

require("./index.html")
require("./Stylesheets.elm")

const notifications = require('./Native/notifications')

var Elm = require("./Main.elm")
var mountNode = document.getElementById("Main")


var app = Elm.Main.embed(mountNode)

if ('serviceWorker' in navigator) {
  navigator.serviceWorker
    .register('./service-worker.js')
}

notifications(app)
