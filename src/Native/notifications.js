module.exports = function(app) {
  function clearFields(object) {
    const keys = Object.keys(object)

    keys.forEach(function(key) {
      if (object[key] === null)
        delete object[key]
    })

    return object
  }

  function requestPermission() {
    Notification.requestPermission()
  }

  function notify(options) {
    options = clearFields(options)

    if (!("Notification" in window)) {
      return alert("This browser does not support system notifications")
    }

    else if (Notification.permission === "granted") {
      return new Notification(options.title, options)
    }

    else if (Notification.permission !== "denied") {
      Notification.requestPermission(function(permission) {
        if (permission === "granted") {
          return new Notification(options.title, options)
        }
      })
    }
  }

  app.ports.requestNotificationPermission.subscribe(requestPermission)
  app.ports.notify.subscribe(notify)
}
