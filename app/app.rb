ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'pry'
require_relative 'data_mapper_setup'
require_relative 'chitter_helpers'

class ChitterManager < Sinatra::Base
  register Sinatra::Flash
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'hashy_ha_ho_ha'

  get '/' do
    erb :index
  end

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

  get '/sessions/delete' do
    erb :'users/sign_out'
  end

  delete '/sessions' do
    session[:current_id] = nil
    flash.keep[:notice] = 'Goodbye'
    redirect '/peeps'
  end

  helpers Helpers

  run! if app_file == $0
end
