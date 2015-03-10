module BCrypt
  class Password
    def initialize(digest)
        @digest = digest
    end
    def ==(password)
        @digest == digest(salt(@digest), password)
    end
    def digest(salt, password)
    end
  end
end
