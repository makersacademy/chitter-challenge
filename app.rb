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
    user = User.authenticate(params[:username], params[:password])

    if (user)
      session[:user] = user.name
      redirect "/user/#{params[:username]}"
    else
      (flash[:nouser] = "Log in unsuccessful, try again?") && (redirect '/sign-in')
    end
  end

  get '/user/:username' do
    @peeps = Peep.all.reverse
    @user = session[:user]
    erb :userpage
  end

  post '/log-out' do
    session[:user] = nil
    redirect '/'
  end

  post '/new-peep' do
    Peep.create(username: params[:username], message: params[:message])
    redirect "/user/#{params[:username]}"
  end

  run! if app_file == $0
end
