import mongoose from 'mongoose';

const { Schema } = mongoose;

const URL = 'mongodb://localhost:27017/web-blog';

mongoose.connect(`${URL}`, {
  useUnifiedTopology: true,
  useNewUrlParser: true,
  useFindAndModify: false,
});

const newScheme = new Schema(
  {
    key1: String,
    key: Number,
    key3: Array,
    key4: Object,
  },
  { collection: 'collection' },
);

export const newDataScheme = mongoose.model('newScheme', newScheme);
