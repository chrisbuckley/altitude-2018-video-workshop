  ######### vcl_log ###########
  
  # Get the delta retrans
  declare local var.delta_retrans INTEGER;
  declare local var.client_ttfb FLOAT;
  declare local var.client_ttfb_msecs INTEGER;
  declare local var.tcpi_rttvar INTEGER;
  declare local var.tcpi_rtt INTEGER;

  set var.delta_retrans = std.atoi(client.socket.tcpi_total_retrans);
  set var.delta_retrans -= std.atoi(req.http.total_retrans);
  set var.client_ttfb = time.to_first_byte;
  set var.client_ttfb *= 1000;
  set var.client_ttfb_msecs = std.atoi(regsub(var.client_ttfb, "\..*", ""));
  set var.tcpi_rttvar = client.socket.tcpi_rttvar;
  set var.tcpi_rttvar /= 1000;
  set var.tcpi_rtt = client.socket.tcpi_rtt;
  set var.tcpi_rtt /= 1000;
  ###############################