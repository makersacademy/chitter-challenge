ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'pry'
require_relative 'data_mapper_setup'

class ChitterManager < Sinatra::Base
  register Sinatra::Flash
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'hashy_ha_ho_ha'

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    user = User.new(params)
    user.save
    session[:current_id] = user.id
    redirect '/peeps'
  end

  get '/peeps' do
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/new' do
    peep = Peep.new(params)
    current_user.peeps << peep
    binding.pry unless peep.save
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :'users/sign_in'
  end

  post '/sessions' do
    user = User.authenticate params[:username],
                            params[:password]
    if user
      session[:current_id] = user.id
      redirect '/peeps'
    else
      redirect '/sessions/new'
    end
  end

  delete '/sessions' do
    session[:current_id] = nil
    flash.keep[:notice] = 'Goodbye'
    redirect '/peeps'
  end

  helpers do
    def current_user
      User.get session[:current_id]
    end

    def first_name(name)
      name.split(' ')[0]
    end
  end

  run! if app_file == $0
end
