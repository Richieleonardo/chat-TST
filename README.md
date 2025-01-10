# Chat-TST

Repository untuk **Tugas Besar Matakuliah II3160 Teknologi Sistem Terintegrasi**. Aplikasi ini adalah aplikasi chat sederhana yang menggunakan **Socket.io** untuk komunikasi client-server dengan beberapa event seperti `set-id`, `send-message`, dan `recieve-message`.

**Richie Leonardo**
**18222071**

---
## Dokumentasi API

Aplikasi ini mencakup dokumentasi event name lengkap yang dapat diakses di: \
[https://chat-tst-production.up.railway.app/docs](https://chat-tst-production.up.railway.app/docs)

---

## Struktur File

```plaintext
│   .dockerignore
│   .gitignore
│   app.js
│   asyncapi.yaml
│   Dockerfile
│   package-lock.json
│   package.json
│   README.md
│
└───docs
    │   index.html
    │
    ├───css
    │       asyncapi.min.css
    │       global.min.css
    │
    └───js
            asyncapi-ui.min.js
```

## Technology and Dependency

- Express : Framework untuk membangung server.
- Socket.io : Library komunikasi real-time client-server.
- Nodemon : Live-reloading selama development.
- @asyncapi/generator : Mendokumentasikan event yang terdapat pada Socket.io 

Dependencies terdaftar dalam package.json : 
```plaintext
{
  "dependencies": {
    "express": "^4.21.2",
    "nodemon": "^3.1.9",
    "socket.io": "^4.8.1"
  },
  "devDependencies": {
    "@asyncapi/generator": "^2.5.0"
  }
}
```

## Event Socket.io

Event yang diimplementasikan 
- connection : Ketika user terhubung ke server.
- set-id : Untuk user bergabung ke room tertentu.
- send-message : Mengirim pesan ke room tertentu
- recieve-message : Untuk menerima pesan dari room.


## Cara Menjalankan Aplikasi

### Untuk development

1. Clone repository ini : 

```bash
  git clone https://github.com/username/chat-TST.git
  cd chat-TST
```

2. Install dependencies :
 ```bash
   npm install
```

3. Jalankan aplikasi :
- Untuk mode development
```bash
npm run devStart
```
- Untuk mode production menggunakan docker
#### Build docker image
```bash
  docker build --no-cache -t <image_name> .
```

#### Menjalankan docker container
```bash
  docker run --name <<container_name>> -p 8072:8072 <<image_name>>
```



