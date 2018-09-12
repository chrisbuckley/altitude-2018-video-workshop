  ######### vcl_deliver ###########

    #### TTFB/TTLB Logging Code ###
  declare local var.start INTEGER;
  declare local var.ttlb INTEGER;
  
  set var.start = std.atoi(req.http.X-Fetch-Start-Time);
  set var.ttlb = std.atoi(time.elapsed.msec);
  set var.ttlb -= var.start;
  
  set req.http.X-TTFB-MS = resp.http.X-TTFB-MS;
  set req.http.X-TTLB-MS = var.ttlb;
  set req.http.X-beresp.-status = resp.http.X-beresp-status;
  
  set req.http.Backend-IP = resp.http.Backend-IP;
  unset resp.http.Backend-IP;
  unset resp.http.X-TTFB-MS;
  unset resp.http.X-beresp-status;
  ###############################