require 'pg'

class User
  def initalize(user_name:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(chitter_challenge_test: 'user_table')
    else
      connection = PG.connect(chitter_challenge: 'user_table')
    end

    @name = user_name
    @password = password
  end
end
