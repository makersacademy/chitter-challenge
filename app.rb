require 'pg'
require 'sinatra'
require './lib/user'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    return erb :index if session[:user_id].nil?

    user = User.find(id: session[:user_id])
    @name = user.name
    @peeps = Peep.all
    erb :logged_in
  end

  post '/post_peep' do
    Peep.create(text: params[:peep], user_id: session[:user_id])
    redirect '/'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    start_session_for(User.sign_up(name: params[:name], email: params[:email], username: params[:username], password: params[:password]))
  end

  get '/log_in' do
    erb :log_in
  end

  post '/log_in' do
    begin
      start_session_for(User.log_in(username: params[:username], password: params[:password]))
    rescue => error
      @error = error
    end
    erb :log_in
  end

  get '/log_out' do
    session[:user_id] = nil
    redirect '/'
  end

  private
  def start_session_for(user)
    session[:user_id] = user.id
    redirect '/'
  end

  run! if app_file == $0

end
