require 'haml'
require 'sinatra/base'
require 'sinatra/flash'
require './app/lib/manager'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @peeps = Manager.get_all_posts
    @users = Manager.get_all_users
    haml :index
  end

end
