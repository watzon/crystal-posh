require "json"

module Posh
    class User

        JSON.mapping(
            id:                 String,
            email:              String,
            guest_buyer_email:  String?,
            username:           String,
            display_handle:     String,
            full_name:          String,
            first_name:         String,
            last_name:          String,
            gender:             String,
            status:             String
        )

    end
end