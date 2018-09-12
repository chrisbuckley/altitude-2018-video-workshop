  ######### vcl_recv ###########
 
  # Record number of retrans on the connection
  set req.http.total_retrans = client.socket.tcpi_total_retrans;
  ###############################