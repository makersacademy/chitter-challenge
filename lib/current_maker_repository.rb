require_relative 'current_maker'

class MakerHandler
  def initialize
    @login_status = false
    @id = nil
  end

  def logged_in?
    return @login_status
  end

  def return_id
    return @id
  end

  def set_login_status(status)
    @login_status = status
  end

end