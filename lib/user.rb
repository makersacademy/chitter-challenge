require 'pg'
require 'sinatra/activerecord'

# disable logging
# old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

class User < ActiveRecord::Base

  def handle
    "@#{self.user_name}"
  end

end
