const express = require('express');   //imports the express library and stores it in a variable called express
const app = express();                //calls express as a function,tnis creates your application object. app is now your web server(defines routes an listeners)
const PORT = 3000;                    //stores the number 3000 in a variable called port that the server listens on.

app.get('/', (req, res) => {                    //defines a route.when someone visits /ur/ the function runs
  res.send('Hello from Dockerized JS App!');    //sneds a response back to the browser.
});

app.listen(PORT, () => {                        //starts the server and listens for requests on port 3000
  console.log(`Server running on port ${PORT}`);
});