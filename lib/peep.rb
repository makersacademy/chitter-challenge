require 'pg'
require 'sinatra/activerecord'

# disable logging
# old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

class Peep < ActiveRecord::Base
  def time
    self.created_at.strftime('%b %e %I:%M%P')
  end
end
