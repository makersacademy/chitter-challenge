module UsersMentioned

    def self.find_names(content_str)
        user = content_str.scan /@(?<name>(\w+))/

        if user 
            return user.flatten
        else
            return false
        end
    end

    def self.validate_names(names_arr, table)
        validated_users = []

        names_arr.each do |name|
           user = table.get(name)
           if user
            validated_users.push(user)
           end
        end

        return validated_users
    end
end