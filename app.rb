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
    @makersignup = session[:username]
    @maker = MakerProfile.all
     erb :profile
  end

  # post '/profile' do
  #   "Hello World"
  # end

  get '/login' do
    erb :login
  end

  # post '/login' do
  #   @makerlogin = MakerProfile.login(username: params[:username], password: params[:password])
  #
  #     redirect '/'
  #   else
  #     redirect '/try_again'
  #   end
  # end

  get '/add_peep' do
    erb :add_peep
    redirect '/'
    #see peep
  end

    run! if app_file == $0

end
