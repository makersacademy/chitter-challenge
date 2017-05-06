require 'sinatra/base'
require 'sinatra/flash'
require 'pry'
require_relative './data_mapper_setup'

ENV['RACK_ENV'] ||= 'development'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'something'
  register Sinatra::Flash

  get '/' do
    @peeps = Peep.all.reverse
    @users = User.all
    @replies = Reply.all
    erb :index
  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/sign_in' do
    @user = User.login(params)
    bad_sign_in if @user == nil
    session[:user] = @user.name
    session[:user_id] = @user.id
    redirect '/'
  end

  get '/sign_up' do
    erb :sign_up
  end

  get '/log_out' do
    session[:user] = nil
    session[:user_id] = nil
    redirect '/'
  end

  post '/peep' do
    Peep.create(text: params[:peep], date_time: DateTime.now, user_id: session[:user_id])
    redirect '/'
  end

  post '/sign_up' do
    params[:password] == params[:verify_password] ? register_user(params) : bad_password
  end

  get '/reply_to/:peep_id' do
    @peep = Peep.get(session[:keep_peep])
    @users = User.all
    @replies = Reply.all(Reply.peep_id => params[:peep_id])
    erb :reply
  end

  post '/log_reply/:peep_id' do
    Reply.create(user_id: session[:user_id], text: params[:reply], peep_id: params[:peep_id], date_time: DateTime.now)
    link = "/"
    redirect link
  end

  private

  def register_user(params)
    @user = User.create(params[:name], params[:handle],
      params[:email], params[:password])
    session[:user] = @user.name
    session[:user_id] = @user.id
    redirect '/'
  end

  def bad_password
    flash[:notice] = 'your passwords did not match, try again'
    redirect '/sign_up'
  end

  def bad_sign_in
    flash[:notice] = 'you could not be signed in, try again'
    redirect '/sign_in'
  end

end
