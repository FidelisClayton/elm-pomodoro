var cacheName = 'elm-pomodoro'
var filesToCache = ['/', '/index.html', '/app.js']

self.addEventListener('install', function(event) {
  return event.waitUntil(caches.open(cacheName).then(function(cache) {
    return cache.addAll(filesToCache)
  }))
})

self.addEventListener('activate', function(event) {
  return event.waitUntil(
    caches.keys().then(function(keyList) {
      return Promise.all(keyList.map(function(key) {
        if (key !== cacheName) {
          return caches.delete(key)
        }
      }))
    })
  )
  return self.clients.claim()
})

self.addEventListener('fetch', function(event) {
  return event.respondWith(
    caches.match(event.request).then(function(response) {
      return response || fetch(event.request)
    })
  )
})
