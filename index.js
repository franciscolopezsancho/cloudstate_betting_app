const cloudstate = require("cloudstate");
const bettinghouse = require("./bettinghouse.js");

const server = new cloudstate.CloudState();
server.addEntity(bettinghouse);
server.start();