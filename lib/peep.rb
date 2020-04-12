require 'pg'
require 'sinatra/activerecord'
require_relative 'user'

# disable logging
# old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

class Peep < ActiveRecord::Base
  def time
    self.created_at.strftime('%b %e %I:%M%P')
  end

  def author_name
    user = User.find(self.user_id)
    "#{user.first_name} #{user.last_name}"
  end
end
