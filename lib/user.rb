require 'active_record'
require 'pg'

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password_hash, presence: true, uniqueness: true

  def self.user_id_from_peep(peep)
    peep.user_id
  end

  def self.username_from_peep(peep)
    user_id = user_id_from_peep(peep)
    User.find_by(id: user_id)&.username
  end

  def self.name_from_peep(peep)
    user_id = user_id_from_peep(peep)
    User.find_by(id: user_id)&.name
  end

end
