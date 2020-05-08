require 'sinatra/base'
require './lib/maker_peep.rb'
require './lib/maker_profile.rb'

#use routes overview for what to call the different routes

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @maker = MakerProfile.all
    erb :list_of_peeps
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    MakerProfile.signup(username: params[:username], name: params[:name], email: params[:email], password: params[:password])
    redirect '/profile'
  end

  get '/profile' do
    # @makerusername = session[:username]
    @maker = MakerProfile.all
     erb :profile
  end

  get '/login' do
    @makerusername = session[:username]
    @makerpassword = session[:password]
    erb :login
  end

  post '/login' do
    @makerusername = session[:username]
    @makerpassword = session[:password]
    session[:uname] = params[:login1]
    session[:pword] = params["login2"]
    redirect '/'
  end

  get '/login_error' do
    erb :login_error
  end

  get '/add_peep' do
    erb :add_peep
    redirect '/'
    #see peep
  end

    run! if app_file == $0

end
