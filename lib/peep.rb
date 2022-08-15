require 'active_record'
require 'pg'
require_relative 'user'

class Peep < ActiveRecord::Base
  def name
    User.find(user_id).name
  end

  def username
    User.find(user_id).username
  end

  def date_time_created_formatted_string
    date_time_created.strftime("%I:%M %p %A %d %B %Y")
  end
end
