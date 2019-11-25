#!/bin/bash

npm init
echo "{
  \"presets\": [
    \"@babel/preset-env\"
  ]
}" > .babelrc
npm install --save-dev @babel/cli @babel/core @babel/node @babel/preset-env nodemon babel-eslint eslint eslint-config-airbnb eslint-config-prettier eslint-plugin-import eslint-plugin-prettier prettier
npm install --save express 
echo "{
  \"extends\": [\"airbnb/base\", \"prettier\"],
  \"parser\": \"babel-eslint\",
  \"plugins\": [\"prettier\"],
  \"rules\": {
    \"arrow-parens\": [\"error\", \"as-needed\"],

    \"prettier/prettier\": [\"error\"],

    \"import/no-unresolved\": 0,
    \"import/no-named-as-default\": 0,
    \"import/prefer-default-export\": 0,
    \"import/newline-after-import\": \"error\",
    \"import/imports-first\": [\"error\", \"absolute-first\"],
    \"import/no-extraneous-dependencies\": [\"error\", {
      \"devDependencies\": true
    }],
       
    \"no-void\": 0,
    \"comma-dangle\": 1,
    \"padded-blocks\": 0,
    \"no-console\": [\"warn\"],
    \"eol-last\": 0,
    \"no-underscore-dangle\": 0,
    \"no-use-before-define\": [\"error\", {
      \"functions\": false,
      \"classes\": false
    }],
    \"key-spacing\": 0,
    \"no-nested-ternary\": 0,
    \"implicit-arrow-linebreak\": 0,
    \"no-confusing-arrow\": 0,
    \"no-unused-vars\": \"error\",
    \"no-unused-expressions\": [\"error\", {
      \"allowShortCircuit\": true
    }],
    \"max-classes-per-file\": [\"error\", 1],
    \"operator-linebreak\": [\"error\", \"before\"],
    \"object-curly-newline\": [\"error\", {
      \"consistent\": true
    }],
    \"object-curly-spacing\": [\"error\", \"always\", {
      \"objectsInObjects\": true
    }]
  },

  \"env\": {
    \"es6\": true
  },

  \"globals\": {
    \"window\": true,
    \"document\": true,
    \"localStorage\": true,
    \"FormData\": true,
    \"FileReader\": true,
    \"Blob\": true,
    \"navigator\": true,
    \"it\": true,
    \"expect\": true,
    \"jest\": true,
    \"alert\": true,
    \"describe\": true,
    \"prompt\": true
  }
}" > .eslintrc

echo "{
  \"printWidth\": 100,
  \"singleQuote\": true,
  \"trailingComma\": \"all\"
}" > .prettierrc

sed -e '6s/$/\n    "start": "nodemon --exec babel-node index.js",/' package.json > package-temp.json
rm package.json
mv package-temp.json package.json

echo "import express from 'express';

const app = express();
const port = 3000;

app.get('/', (req, res) => res.send('Hello World!'));

app.listen(port, () => console.log('Hello World!'));" > index.js

