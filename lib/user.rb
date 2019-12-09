require_relative 'login_information'

class User < ActiveRecord::Base
  has_many :peeps
  validates_uniqueness_of :username
  validates_uniqueness_of :email

  def peep message, user_id
    Peep.new_peep message, user_id
  end

  def all_peeps
    Peep.all_by id
  end

  def self.log_in user
    user.update logged_in: true
  end

  def self.log_out user
    user.update logged_in: false
  end
end
