require_relative 'signup'
require 'rom'

class SignupRepository
    def initialize
      @rom = ROM.container(:sql, 'postgres://localhost:5432/chitter', username: 'calumwilmot', password: 'postgres') do |config|
          config.relation(:peeps) do
            schema(infer: true)
            auto_struct true
          end
        end
      @peeps = @rom.relations[:peeps]
    end

    def create(@user)
        # https://rom-rb.org/learn/changeset/5.2/
        @peeps.changeset(:create, email:, password).commit
    end

    def login(email, @password)
      SELECT users WHERE :password = password AND :email = email
    end
end

  