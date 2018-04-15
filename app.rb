require 'sinatra'
require 'sinatra/flash'
require './lib/peep.rb'
require './lib/user.rb'

class Chitter < Sinatra::Base

  register Sinatra::Flash
  enable :sessions

  get '/' do
    @peeps = Peep.all.reverse
    erb :home
  end

  get '/sign-in' do
    erb :signin
  end

  get '/sign-up' do
    erb :signup
  end

  post '/sign-up' do
    flash[:signed_up] = 'Sign up successful! Now sign in and CHITTER!!' if User.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
    redirect '/sign-in'
  end

  post '/log-in' do
    (flash[:nouser] = "Log in unsuccessful, try again?") && (redirect '/sign-in') unless User.signin(params[:username], params[:password])
    redirect '/user'
  end

  get '/user' do
    @peeps = Peep.all.reverse
    @user = User.current_user
    erb :userpage
  end

  post '/log-out' do
    User.signout
    redirect '/'
  end

  post '/new-peep' do
    Peep.create(username: params[:username], message: params[:message])
    redirect '/user'
  end

    run! if app_file == $0
end
