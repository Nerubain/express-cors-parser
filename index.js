import express from 'express';
import bodyParser from 'body-parser';
import cors from 'cors';

const app = express();
const port = 3000;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(
  cors({
    credentials: true,
    origin: true,
  }),
);

app.get('/', (req, res) => res.send('Hello World!'));

app.listen(port, () => console.log('Hello World!'));
