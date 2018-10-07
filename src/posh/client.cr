require "http/client"
require "./login_response"

module Posh
    class Client

        getter logged_in : Bool = false
        private getter token : String? = nil

        def initialize
        end

        def request(
            method,
            route : String | URI,
            headers : HTTP::Headers? = nil,
            *,
            body : HTTP::Client::BodyType? = nil,
            form : String? | IO? | Hash? = nil)

            if !@logged_in
                raise Exception.new("To make a request you must first authenticate with the Poshamrk API.")
            end
                
            url = File.join("https://poshmark.com", route)

            if body
                HTTP::Client.exec(method, url, headers, body)
            elsif form
                body = HTTP::Params.encode(form)
                HTTP::Client.exec(method, url, headers, body)
            else
                HTTP::Client.exec(method, url, headers)
            end
        end

        def login(username : String, password : String)

            response = HTTP::Client.post "https://api.poshmark.com/api/auth/users/access_token", form: {
                "user_handle" => username,
                "password" => password
            }

            if response.status_code > 299
                raise Exception.new("Failed to authenticate. Username or password incorrect.")
            end

            @logged_in = true
            LoginResponse.from_json(response.body)
        end

    end
end

cli = Posh::Client.new
res = cli.login("cwatzon", "Pi31415926!")
pp cli.request("POST", "/user/59aa262d48156015e501bca0/follow_user",
    HTTP::Headers{"Authorization" => "Bearer NWJhZmE3ZTBkY2Y4NTVkM2ViYWIyOGVjfDE1NzA0MDk2Mjh8MC4yfDB8NWJiOTU5MWM1YTlkMjE3MmI2OTMwNzQ1fDB8RHNXZFNKWl92VzhzcmhxUjhkaEc1clBzQm5NQVlFek4tS3dwY3VLWVJxaw"})