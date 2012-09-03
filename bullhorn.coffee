publicServer = require('http').createServer()
io = require('socket.io').listen(publicServer)

express = require('express')
privateServer = express()
privateServer.use(express.bodyParser())

privateServer.post '/', (req, res) ->
  io.sockets.send(req.param('message'))
  res.send(200)

publicServer.listen(8080)
privateServer.listen(8081)
