require 'sinatra/base'
require_relative 'datamapper_setup'

class ChitterChatter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/users' do
    User.create(email: params[:email],
                password: params[:password],
                name: params[:name],
                username: params[:username])
    redirect to '/'
  end

  get '/log-in' do
    erb :log_in
  end

end
