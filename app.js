const express = require('express');
const { createServer } = require('http');
const { Server } = require('socket.io');
const path = require('path');

const app = express();
const httpServer = createServer(app);
const io = new Server(httpServer, {
    cors: {
        origin: '*',
    }
});

app.use('/docs', express.static(path.join(__dirname, 'docs')));

// //admin-ui
// instrument(io, { auth: false });

//when connect send chat (edit this)
io.on('connection', socket => {
    console.log('user connected');
    socket.on('set-id', (roomID) => {
        socket.join(roomID);
        console.log('room joined')
    })

    //TODO
    socket.on('send-message', (message, storedID) => {
        socket.broadcast.to(storedID).emit('recieve-message', message); //TODO implement encrypt
    })
});

//Start server
const PORT = 8072;
httpServer.listen(PORT, () => {
    console.log(`Server is running on on port ${PORT}`);});