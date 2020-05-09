require 'pg'
require_relative 'maker_profile' #maker_peep might need to take name and user_name from sign_up

class MakerPeep

  attr_reader :peep, :username, :datetime, :name, :email

  def initialize(id:, peep:, datetime:, username:)
    @id = id
    @peep = peep
    @datetime = datetime
    @username = username
    # @maker_sign_up = MakerSignUp.new(username: "#{username}", name: "#{name}", email: "#{email}", password: "#{password}") #may need to put in initialize
    # #parameters as another default = for the sake of testing and mocking.
  end

  def self.all
    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect(dbname:'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
     MakerPeep.new(id: peep['id'], peep: peep['peep'], datetime: peep['datetime'], username: peep['username'])
   end
  end

  def self.create(peep:, username:, datetime:)
     time = Time.new
    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect(dbname:'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (peep, datetime, username) VALUES('#{peep}', '#{time.strftime("%d/%m/%Y,%k:%M")}', '#{username}') RETURNING id, username, peep, datetime;")
    MakerPeep.new(id: result[0]['id'], peep: result[0]['peep'], datetime: result[0]['datetime'], username: result[0]['username'])
  end
end
