require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/cheet'
require_relative 'lib/user'
require 'rubygems'
require 'data_mapper'
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/' do
    redirect '/cheets'
  end

  get '/cheets' do
    @cheets = Cheet.reverse_chronological_cheets
    erb(:cheets)
  end

  post '/cheets/new' do
    Cheet.add_cheet(params[:title], params[:body])
    redirect '/cheets'
  end

  get '/user/new' do
    erb(:sign_up)
  end

  post '/user/new' do
    @user = User.sign_up(params[:email], params[:password], params[:name], params[:username])
    session[:user_id] = @user.id
    redirect '/user'
  end

  get '/user' do
    # TODO - currently taking user from persistent database. Would cause issues if another user signed up at some time.
    # Need to create live logged in user to pull this from
    @user = User.get(session[:user_id])
    erb(:sign_up_successful)
  end

end
