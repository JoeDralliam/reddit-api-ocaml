let print_request_body body =
  print_string (body#value)

let _ = 
  let username = Sys.argv.(1) in
  let passwd = Sys.argv.(2) in
  print_endline ("Username : " ^ username) ;
  print_endline ("Password : " ^ passwd) ;

  
  let pipeline = new Http_client.pipeline in

  Ssl.init ();
  let ctx = Ssl.create_context Ssl.TLSv1 Ssl.Client_context in
  let tct = Https_client.https_transport_channel_type ctx in
  pipeline # configure_transport Http_client.https_cb_id tct ;

  print_request_body (Account.login pipeline username passwd) ;
  print_newline ()
(*  print_request_body (Account.me pipeline) *)
