## Visibility- Logging variables for video
### Featured
#### retrans=%{var.delta_retrans}V
The number of times packets had to be retransmitted in the course of delivering the requested object. Ideally this number should always be zero.

#### http\_status_message=%{resp.response}V
Logs the status message if any. This is particularly useful with 503 errors, esepcially since Fastly rewrites an 50X error as 503.

#### client\_as_number=%{client.as.number}V
Logs the end-user's network AS Number. To determine which network is involved, you can use peeringdb.com to look up the network by its ASN.

#### cache\_tier=%{if(req.http.Fastly-FF, "Shield", "Edge")}V
Determines if the request is being handled on a shield POP or an edge POP.

#### pop=%{server.datacenter}V 
Which POP the request is being handled from. You can get a list of POPs via the API: https://docs.fastly.com/api/tools#datacenter

#### rtt\_msecs=%{client.socket.tcpi_rtt}V 
The client socket smoothed round-trip time in microseconds. Basically how long it's taking to talk to the end-user.

#### client\_ip=%{req.http.Fastly-Client-IP}V 
Logs the end-user's IP address.

#### client\_country\_code=%{client.geo.country_code3}V 
Logs the end-user's 3 letter country code based on its IP address. 
See the ISO 3166-1 (https://en.wikipedia.org/wiki/ISO_3166-1) for a list of the country codes.

#### client_city=%{client.geo.city}V
Logs the end-user's city based on its IP address.

#### tls_version="%{tls.client.protocol}V"
The version of TLS the end-user is using. This can useful for cross-referencing against errors to determine if it's a legacy device or legacy TLS issue. TLS 1.0 and 1.1 are being deprecated, but older devices, especially Android mobiles cannot support 1.2.

#### user_agent="%{req.http.User-Agent}V" 
Logs the end-user's user agent. Useful to determine if issues are specific to a browser, device, device type (e.g. mobile vs desktop) etc.

#### referer=%{req.http.Referer}V 
The referring URL. Useful in determining where users are coming from.

#### host=%{req.http.host}V 
The domain the request is being sent to.

#### url=%{req.url}V 
The first forward slash and everything after, including query string.

#### http_status=%{resp.status}V 
The HTTP Status code. For a list of status codes and their explanations, go here: https://http.cat/

#### origin\_http_status=%{beresp.status}V

#### restarts=%{req.restarts}V
The number of restarts in a request. Restarts are used in VCL for things like stale while revalidate/stale if error, authentication against an API or paywall, etc.

#### cache_status="%{resp.http.X-Cache}V"
Shows if the object was a cache hit or miss.
 
#### fastly\_state=%{fastly_info.state}V 
Provides additional information, like whether or not it's a pass.

#### client\_ttfb=%{time.to\_first_byte}V 
Time to First Byte to the end user.

#### response_time=%{time.elapsed.msec}V
Total time of the request.
 
#### response\_bytes=%{resp.bytes_written}V 
The number of bytes written in the response

##### content_length=%{resp.http.Content-length}V
The size of the object. If response_bytes is less than content_length, the entire object was not delivered, which can happen due to client aborts.

To determine Throughput, you can divide response_bytes by response_time.

#### server_id=%{server.identity}V
Which node on the POP the response was handled from. This can be useful to identify problematic nodes.

#### rtt\_var\_msecs=%{client.socket.tcpi_rttvar}V
The client socket round-trip time variance in microseconds. JFH: Is this even needed?
 
#### nexthop_ip=%{client.socket.nexthop}V 
The IP address of the next gateway. Tells you which route we directed the request to.

#### origin\_http_status=%{beresp.status}V
The HTTP status code returned by the origin.

#### origin_ip=%{req.http.Backend-IP}V 
The IP address of your origin. Useful if you have multiple origins.

#### origin_ttfb=%{req.http.X-TTFB-MS}V
Time To First Byte from the origin. The lower the value the better. 
FYI: If Streaming_Miss is enabled, the CLIENT_TTFB will be very similar.

#### origin_ttlb=%{req.http.X-TTLB-MS}V
Time To Last Byte from your origin. The lower the value the better. Higher values can lead to rebuffering.
FYI If Streaming Miss is enabled, the CLIENT_TTLB will be very similar.
