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
           user = table.first(:username => name)
           if user
            p validated_users.push(user)
           else
            p user
           end
        end
        return validated_users
    end

    def self.mentions(content,table)
        names = find_names(content)
        if names
            names = validate_names(names, table)
        else
            'nothing'
        end
    end
    
end