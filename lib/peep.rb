require 'sinatra/activerecord'
require_relative 'user'

# disable logging
ActiveRecord::Base.logger = nil

class Peep < ActiveRecord::Base
  def time
    self.created_at.strftime('%b %e %I:%M%P')
  end

  def author_name
    author.full_name
  end

  def author_handle
    author.handle
  end

  def author
    User.find(self.user_id)
  end
end
