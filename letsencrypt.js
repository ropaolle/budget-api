const express = require('express');

const app = express();

app.use(express.static(__dirname, { dotfiles: 'allow' }));

app.listen(80, () => {
  console.info('HTTP server running on port 80');
});
