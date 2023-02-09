require "sinatra/base"
require "sinatra/reloader"
require "sinatra/activerecord"

require_relative "./models/user"
require_relative "./models/peep"

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    @peeps = Peep.joins(:user).reverse_order
    return erb(:homepage)
  end
end
