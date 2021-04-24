require './config/environment'
require './app/models/peep'
require './app/models/user'

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
    user = User.find_by(:username => params[:username])
    peep = Peep.new({:user => user, :status => params[:status]}) 
    peep.save 
    redirect '/'
  end
end
