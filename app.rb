require 'sinatra/base'
require 'sinatra/activerecord'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  enable :sessions

  get '/' do
    erb :index, :layout => :layout
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    User.create(username: params[:username],
      name: params[:name],
      email: params[:email],
      password: params[:password])
    redirect '/all_peeps'
  end

  get '/all_peeps' do
    @peeps = Peep.all
    erb :all_peeps, :layout => :layout
  end

  post '/all_peeps' do
    Peep.create(peep: params[:peep])
    redirect '/all_peeps'
  end

  get '/login_in' do
    username = session[:username]
    erb :login_in
  end

  post '/login_in' do
    session[:username] = params[:username]
    @username = session[:username]
    redirect '/all_peeps'
  end

  post '/log_out' do
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
