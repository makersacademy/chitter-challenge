require 'sinatra/base'
require_relative 'lib/chitter'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/chitter' do
    @all_peeps = ["Here is a first peep - peep peep", "Here is a second peep - peep peep"]
    erb :'chitter/index'
  end

  get '/chitter/new' do
    erb :'chitter/new'
  end

  post '/chitter/new' do
    @new_peep = params[:post_peep]
    redirect '/chitter'
  end

  run! if app_file == $0

end
