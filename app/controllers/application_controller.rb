require './config/environment'
require './app/models/peep'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
  end

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peep' do
    p params
    Peep.new(params[:username], params[:peep])
    redirect '/'
  end
end
