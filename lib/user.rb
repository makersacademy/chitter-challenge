require_relative 'login_information'
require_relative 'peep_record'

class User
  attr_reader :username, :email, :password, :login

  def initialize username, email, password, 
                 login_class = LoginInformation, 
                 peep_record = PeepRecord.new

    @login = login_class.new email, password
    @username = username
    @email = @login.email
    @password = @login.password
    @peep_record = peep_record
  end

  def peep message
    @peep_record.new_peep message
  end

  def all_peeps
    @peep_record.all
  end
end
