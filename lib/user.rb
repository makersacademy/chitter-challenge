require_relative 'login_information'

class User < ActiveRecord::Base
  def peep message, user_id
    Peep.new_peep message, user_id
  end

  def all_peeps
    Peep.all_by id
  end
end
