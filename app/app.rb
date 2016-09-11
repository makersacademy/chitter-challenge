ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'datamapper_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/sign_up' do
    @user = User.new(email: params[:email],
                    username: params[:username],
                    name: params[:name],
                    password_digest: params[:password],)
    @user.save
    redirect '/'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
