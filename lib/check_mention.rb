module UsersMentioned


    def self.find_names(content)
        user = content.scan /@(?<name>(\w+))/

        if user 
            return user.flatten
        else
            return false
        end
    end

   
end



   
 