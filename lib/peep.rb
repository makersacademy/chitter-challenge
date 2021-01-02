require 'active_record'

class Peep < ActiveRecord::Base
  belongs_to :user
  has_many :tags
  has_many :users, through: :tags

  def tagged_users
    users
  end

end
