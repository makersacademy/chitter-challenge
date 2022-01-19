require 'sinatra/base'
require 'sinatra/reloader'
require 'time'
require 'pg'
require './lib/peep'
require './lib/user'



class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload './lib/peep'
    also_reload './lib/user'
  end

  enable :sessions

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @user = session[:username]
    # @user = User.find(session[:username])
    # put the above in /peeps and make sure .find is working (may need to add a method?)
    @peeps = Peep.all
    erb :peeps
  end

  get '/sign_up' do
    erb :sign_up
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/session' do

    user = User.authenticate(email: params[:email], password: params[:password])
    
    session[:username] = user.username
    redirect('/peeps')
  end



  post '/register' do
    user = User.create(name: params['username'], username: params['username'], email: params['username'], password: params['username'])
    flash.next[:info] = 'Weclcome #{user.username}'
    redirect '/peeps'
  end

  post '/new_peep' do
    Peep.create(message: params['message'], user: User.username, time: Time.now.to_s)
    redirect '/peeps'
  end

  run if app_file == $0

end