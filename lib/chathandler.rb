require_relative 'messagehandler'
require_relative 'userhandler'
require_relative 'taghandler'
module ChatHandler

  def self.included(base)
    base.extend UserHandler
    base.extend MessageHandler
    base.extend TagHandler
  end

end
