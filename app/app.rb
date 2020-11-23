require 'sinatra/base'
require_relative '../lib/peep'

class Chitter < Sinatra::Application

  enable :sessions

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/user/new' do
    session[:name] = params[:name]
    session[:username] = params[:username]
    session[:email] = params[:email]
    session[:password] = params[:password]
    redirect '/peeps'
  end

  # post '/user/login' do
  #   session[:login] = params[:login]
  #   redirect '/peeps'
  # end

  get '/peeps' do
    Peep.establish_connection
    @peeps = Peep.display_peeps
    @username = session[:username]
    erb :peeps
  end

  get '/new' do
    erb :add_peep
  end

  post '/peeps' do
    Peep.post_peep(peep_body: params[:peep], username: session[:username])
    redirect '/peeps'
  end

  get '/timeline' do
    @all_peeps = Peep.display_peeps
    @username = session[:username]
    erb :timeline
  end

  run! if app_file == $0
end