require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/user'


class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    p user = User.create(params[:name],params[:username],params[:email],params[:password])
    p session[:current_user] = user.id
    flash[:welcome]="Welcome to Chitter #{params[:name]}"
    redirect '/peeps'
  end

  get '/peeps' do
    p @peeps = Peep.all
    erb :peeps
  end

  post '/peeps' do
    p @user_id = session[:current_user]
    p Peep.create(@user_id, params[:peep_input])
    redirect '/peeps'
  end

  run! if app_file == $0

end
