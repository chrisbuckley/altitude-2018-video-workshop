  ######### vcl_fetch ###########

  #### TTFB/TTLB Logging Code ###
  declare local var.start INTEGER;
  declare local var.ttfb INTEGER;
    
  set var.start = std.atoi(req.http.X-Fetch-Start-Time);
  set var.ttfb = std.atoi(time.elapsed.msec);
  set var.ttfb -= var.start;
  set beresp.http.X-TTFB-MS = var.ttfb;
  
  ##### backend IP and backend response status 
  set beresp.http.backend-ip = beresp.backend.ip;
  set beresp.http.X-beresp-status = beresp.status;
  ###############################