require "json"

module Posh
    class Session
        
        JSON.mapping(
            user_id:    {
                type: String,
                key: "user-id"
            },
            token:      String
        )

    end
end