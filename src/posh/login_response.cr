require "json"
require "./user"

module Posh
    class LoginResponse
        
        JSON.mapping(
            access_token:       String,
            created_at:         Int32,
            expires_at:         String,
            user:               User,
            user_status:        String,
            auth_session_id:    String
        )

    end
end