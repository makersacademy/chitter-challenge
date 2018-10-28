require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require_relative 'chitter_helpers'
require_relative 'database_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  helpers ChitterHelpers

  get '/' do
    erb :index
  end

  get '/peeps' do
    current_user
    flash.now[:message] = 'No peeps posted yet!' if current_peeps.empty?
    erb :peeps
  end

  get '/peeps/:id' do
    current_user
    flash.now[:message] = 'No peeps posted yet!' if current_peeps.empty?
    erb :peeps
  end

  post '/peeps/:id/new' do
    redirect '/peeps' if Peep.create(params[:peep], params[:id])
    flash.next[:warning] = 'Please enter text before peeping!'
    redirect "/peeps/:id"
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    valid_user = User.create(
      email: params[:email], password: params[:password],
      name: params[:name], username: params[:username]
    )
    if valid_user
      session[:id] = valid_user.first['id']
      redirect "/peeps/#{session[:id]}"
    else
      flash.next[:warning] = 'Please fill in all fields.'
      redirect '/sign_up'
    end
  end

  post '/session/new' do
    if (user = User.authenticate(params[:email], params[:password]))
      session[:id] = user.id
      redirect "/peeps/#{session[:id]}"
    else
      flash.next[:warning] = 'Your email or password is incorrect.'
      redirect '/'
    end
  end

  post '/session/destroy' do
    session.clear
    flash.next[:message] = 'You have signed out.'
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
