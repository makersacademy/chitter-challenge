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

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps/new' do
    redirect '/peeps' if Peep.create(params[:text], params[:author])
    params[:text].chars.length > 240 ? flash[:n] = Flash.long_peep : flash[:n] = Flash.no_name
    redirect '/peeps/new'
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users/new' do
    flash[:n] = Flash.welcome(params[:name])
    redirect '/peeps' if User.create(params[:email], params[:password], params[:name], params[:username])
    !params[:email].chars.include?("@") ? flash[:n] = Flash.invalid_mail : flash[:n] = Flash.too_short
    redirect '/users/new'
  end

end
