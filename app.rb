require 'sinatra/base'
require './lib/peep.rb'
require './lib/users.rb'

class Chitter < Sinatra::Base
  enable :sessions
  get '/' do
    @user = session[:user]
    @peeps = Peep.all
    erb :peeps
  end

  post '/add_peep' do
    @peep = params[:peep]
    @time = Time.now
    Peep.post(peep: @peep, posted_at: @time)
    redirect '/'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    user = User.create(name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password])
    redirect '/log_in'
  end

  get '/log_in' do
    erb :log_in
  end

  post '/log_in' do
    user = User.find(email: params[:email], password: params[:password])
    session[:user] = user
    redirect '/'
  end

  post '/log_out' do
    session.clear
    redirect '/'
  end

end
