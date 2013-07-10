

let print_request_body body =
  print_string (body#value)

let get_subredditInfo pipeline ?(sorting="") sr =
  let uri = Printf.sprintf "http://www.reddit.com/r/%s/%s.json" sr sorting in
  let request = new Http_client.get uri in
  pipeline#add request ;
  pipeline#run ()      ;
  if request#status = `Successful
  then request#response_body
  else failwith "Http request failed in get_subredditInfo"



let _ =
  let pipeline = new Http_client.pipeline in
  print_request_body (get_subredditInfo pipeline "news")
