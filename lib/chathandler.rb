require_relative 'peephandler'
require_relative 'userhandler'
require_relative 'taghandler'
module ChatHandler

  def self.included(base)
    base.extend UserHandler
    base.extend PeepHandler
    base.extend TagHandler
  end

end
