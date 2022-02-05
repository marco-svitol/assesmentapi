module.exports = myapp => {
  const routerapp =      require("express").Router();
  const routermetrics = require("express").Router();
  const loadconfig = require('../tikoapi.config/').loadconfig;
  const apiexternal = require("../logic/api.logic.tikoapi");
  const apihealth = require("../logic/health");

  //routerapp.use(loadconfig);

  routerapp.post("/setkey",  apiexternal.setkey );
  routerapp.get("/getkey",    apiexternal.getkey );
  myapp.use('/api/v1', routerapp);

  routermetrics.get("/health", apihealth.health);
  myapp.use('/', routermetrics);
};