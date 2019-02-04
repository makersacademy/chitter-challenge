require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, :unique => true
  property :email, String, :unique => true
  property :password, BCryptHash
  property :name, String

  has n, :peeps

  def self.authenticate(email:, password:)
    return nil unless User.first(:email => email)
    user = User.first(:email => email)
    user.password == password ? user : nil
  end

  def self.add(username:, email:, password:, name:)
    create(username: username, email: email, password: password, name: name)
  end

  def self.check_tags(tags:, peep:, emailer: Emailer)
    valid_users = tags.map{ |tag| User.first(:username => tag) }.select{|user| !user.nil?}
    valid_users.each{ |user| emailer.send_email(to: user.email, peeper: User.first(:id => peep.user_id).username, :content => peep.content) }
  end
end
