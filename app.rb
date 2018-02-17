require 'sinatra/base'
require 'sinatra/flash'
require './lib/database_connection_setup'
require './lib/peep'
require './lib/user'
require './lib/flash'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect ('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:'peeps/index')
  end

  post '/peeps/new' do
    redirect '/peeps' if Peep.create(params[:text], params[:author])
    params[:text].chars.length > 240 ? flash[:n] = Flash.long_peep : flash[:n] = Flash.no_name
    redirect '/peeps'
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users/new' do
    flash[:n] = Flash.welcome(params[:name])
    redirect '/peeps' if User.create(params[:email], params[:password], params[:name], params[:username])
    flash[:n] = Flash.email_in_use if User.email_in_use?(params[:email])
    flash[:n] = Flash.username_in_use if User.username_in_use?(params[:username])
    flash[:n] = Flash.too_short if !User.valid?(params[:username], params[:name], params[:password])
    redirect '/users/new'
  end

  get '/users/log_in' do
    erb(:'users/log_in')
  end

  post '/users/log_in' do
    flash[:n] = Flash.after_log_in(params[:username])
    redirect '/peeps' if User.matching_data(params[:username], params[:password])
    flash[:n] = Flash.no_match if !User.matching_data(params[:username], params[:password])
    redirect '/users/log_in'
  end

end
