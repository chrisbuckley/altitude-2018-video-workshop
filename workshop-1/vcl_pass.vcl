  ######### vcl_pass ###########

  #### TTFB/TTLB Logging Code ###
  set req.http.X-Fetch-Start-Time = time.elapsed.msec;
  ###############################