class Peep < ActiveRecord::Base
  def receive_like user_id, peep_id
    Like.create user_id: user_id, peep_id: peep_id
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
