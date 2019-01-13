ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './lib/message'
require './lib/user'
require './config/data_mapper'

class Chitter < Sinatra::Base
  enable :sessions
  enable :method_override

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @messages = Message.all
    erb(:peeps)
  end

  get "/chitter_profile" do
    @messages = Message.all
    erb(:chitter_profile)
  end

  post '/peep' do
    Message.create(
      content: params[:message]
    )
    redirect '/chitter_profile'
  end

  post '/signup' do
    user = User.create(
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    session[:id] = user.id
    redirect "/chitter_profile"
  end

end
