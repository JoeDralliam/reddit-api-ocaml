
let login pipeline username password =
  let request = 
    let r = new Http_client.post "https://ssl.reddit.com/api/login"
      ["api_type", "json" ; "user", username ; "passwd", password] in
    let header = r#request_header `Base in
    header#update_field "user-agent" "ocaml-written /u/JoeDralliam's bot" ;
    r#set_request_header header ;
    r
  in
  pipeline#add request ;
  pipeline#run () ;

  if request#status = `Successful || true
  then request#response_body
  else failwith "Http request failed in login"


let me pipeline =
  let request = new Http_client.get "http://www.reddit.com/api/me.json" in
  pipeline#add request ;
  pipeline#run () ;

  if request#status = `Successful || true
  then request#response_body
  else failwith "Http request failed in me"
