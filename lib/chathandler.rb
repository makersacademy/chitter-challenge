require_relative 'chat'
require_relative 'userhandler'

module ChatHandler

  def self.included(base)
    base.extend UserHandler
    base.extend Chat
  end

end
