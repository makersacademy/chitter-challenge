require 'sinatra/base'
require './lib/maker_peep.rb'
require './lib/maker_profile.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = MakerPeep.all
    erb :list_of_peeps
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    @makersignup = MakerProfile.signup(username: params[:username], name: params[:name],
      email: params[:email], password: params[:password])
    redirect '/profile'
  end

  get '/profile' do
    @makerall = MakerProfile.all
    erb :profile
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    @makerall = MakerProfile.all
    session[:uname] = params[:login1]
    session[:pword] = params[:login2]
    redirect '/home'
  end

  get '/login_error' do
    erb :login_error
  end

  get '/home' do
    @peeps = MakerPeep.all
    @makerall = MakerProfile.all
    erb :home_list
  end

  get '/add_peep' do
    @makerall = MakerProfile.all
    erb :add_peep
  end

  post '/add_peep' do
    MakerPeep.create(peep: params[:peep], username: params[:username], datetime: params[:datetime])
    redirect '/home'
  end

  run! if app_file == $0

end
