console.log("Hola desde el servidor")

const express = require('express'); // importa express
const cors = require('cors');
const app = express();

app.use(cors());
app.use(express.static('public'))
app.use(express.json()) // permite compartir forms
app.use(express.urlencoded({extended: true}));

app.get('/', (req, res) => {
    res.sendFile('index.html', {root: 'public'})
})




app.listen(3000, () => {
    console.log('servidor corriendo...')
})