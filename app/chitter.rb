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

  post '/posts/new' do
    Manager.add_peep(params[:peep_author], params[:peep_message])
    redirect '/'
  end

end
