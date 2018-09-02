require 'pg'
require 'uri'

class Profile

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM profile")
    result.map { |profile| profile['username'] }
  end

  def self.create(username:, name:, email:, password:)
    return false unless is_email?(email)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO profile (username, name, email, password) VALUES( '#{username}', '#{name}', '#{email}', '#{password}' );")
  end

private

  def self.is_email?(email)
    email =~ /\A#{URI::regexp(['@'])}\z/
  end

end
