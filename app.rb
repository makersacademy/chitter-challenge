require 'sinatra/base'
require './lib/dm-psql'

class Chitter < Sinatra::Base
  enable :sessions

  get '/?' do
    @user = User.class_variable_get(:@@current_user)
    @peeps = Peep.all(:order => [:peep_time.desc])
    erb :home
  end

  get '/user/login/?' do
    erb :login
  end

  post '/user/login/?' do
    user = User.first(
      username: params['username'], 
      password: params['password']
    )
    User.class_variable_set(
      :@@current_user, 
      user      
    )
    redirect '/'
  end

  get '/user/logout/?' do
    User.class_variable_set(:@@current_user, nil)
    redirect '/'
  end

  get '/user/register/?' do
    erb :register
  end

  post '/user/register/?' do
    user = User.create(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    User.class_variable_set(
      :@@current_user, 
      user      
    )
    redirect '/'
  end

  get '/peep/create/?' do
    erb :create_peep
  end

  post '/peep/create/?' do
    Peep.create(
      peep: params[:peep],
      peep_time: Time.now,
      user: User.class_variable_get(:@@current_user)
    )
    redirect '/'
  end

  run! if app_file == $0
end
