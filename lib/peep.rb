class Peep < ActiveRecord::Base
  has_many :luvs
  belongs_to :user

  def receive_luv user_id, peep_id
    Luv.create user_id: user_id, peep_id: peep_id
  end

  def timestamp
    created_at.strftime('%k:%M')
  end

  def self.new_peep body, user_id
    create body: body, user_id: user_id
  end

  def self.all_by user_id
    Peep.where user_id: user_id
  end
end
