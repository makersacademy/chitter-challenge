require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require_relative 'lib/peep'
require_relative 'lib/user'
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @peeps = Peep.all
    @users = User.all
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.reverse_chron_order_peeps
    erb :peeps
  end

  post '/peeps/new' do
    @peeps = Peep.all
    @user = User.all
    peep = Peep.add(params[:content])
    flash[:notice] = "It ain't fun if you don't type at least one" unless peep.content.length > 0
    redirect '/peeps'
  end

  get '/user/new' do
    erb :sign_up
  end

  post '/user/new' do
    user = User.sign_up(params[:Email], params[:Password], params[:Name], params[:Username])
    session[:user_id] = user.id
    redirect '/user'
  end

  get '/user' do
    @user = User.get(session[:user_id])
    erb :sign_up_successful
  end

  run! if app_file == $0
end
