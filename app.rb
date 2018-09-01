require 'sinatra/base'
require_relative './lib/peep_manager.rb'
require_relative './lib/users.rb'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    unless session[:current_user] == nil
      @current_user = session[:current_user]
      @current_user_name = @current_user.user_name
    else
      @current_user_name = "no one"
    end
    erb :welcome
  end

  get '/peep_feed' do
    @peeps = Peeps.all
    erb :peep_feed
  end

  get '/post_peep' do
    erb :post_peep
  end

  post '/post_peep' do
    @peep = params[:peep_field]
    Peeps.create(@peep)
    redirect('peep_feed')
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    Users.create(params[:name], params[:user_name], params[:email], params[:password])
    'sign up complete'
  end

  post '/sign_up/check_details' do
    if Users.unique_input_checker(params[:email], :email)
      flash[:notice] = "Email address already in use"
      redirect '/sign_up'
    elsif Users.unique_input_checker(params[:user_name], :user_name)
      flash[:notice] = "User name already in use"
      redirect '/sign_up'
    else
      Users.create(params[:name], params[:user_name], params[:email], params[:password])
      flash[:sign_up_notice] = "Sign up successful"
      redirect '/'
    end
  end

  get '/log_in' do
    erb :log_in
  end

  post '/log_in/check_details' do
    unless Users.log_in_checker(params[:user_name], params[:password])
      flash[:log_in_fail] = "User name and/or password incorrect"
      redirect '/log_in'
    else
      session[:current_user] = Users.select_user(params[:user_name])
      redirect '/'
    end
  end

  get '/log_out' do
    session[:current_user] = nil
    redirect '/'
  end

  run! if app_file == $0
end
