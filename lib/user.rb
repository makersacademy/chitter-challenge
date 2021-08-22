require 'pg'
#require 'activerecord'

class User #< ActiveRecord::BASE
   
    def create(username, email)
        if ENV['ENVIRONMENT'] == 'test'
            @connection = PG.connect(dbname: 'chitter_test')
          else
            @connection = PG.connect(dbname: 'chitter')
          end
          
        @user = User.where(:username => username, :email => email).first_or_create
    end

end