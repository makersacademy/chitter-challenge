class Maker 
    attr_accessor :id, :name, :username, :email, :password, :loggedin

    def initialize
        @loggedin = false
    end

    def loggedin
        return @loggedin
    end

    def log_in
        @loggedin = true
    end

    def log_out
        @loggedin = false
    end
end