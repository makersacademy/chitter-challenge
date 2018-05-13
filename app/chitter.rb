require 'haml'
require 'sinatra/base'
require 'sinatra/flash'
require './app/lib/peep_manager'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @peeps = PeepManager.display_posts
    haml :index
  end

end
