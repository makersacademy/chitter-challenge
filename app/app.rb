require_relative 'data_mapper_setup'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'helpers'



class ChitterWeb < Sinatra::Base

  include Helpers

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    erb :'peeps'
  end

  get '/kill' do
    session.clear
    erb :'peeps'
  end

  get '/users/new' do
    erb :'new_users'
  end

  post '/users/new' do
  user = User.new(email: params[:email],
                name: params[:name],
                username: params[:username],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if user.save
    session[:user_id] = user.id
    redirect to('/')
  else
    flash.now[:notice] = "Your Password and confirmation password do not match - please try again"
    erb :'new_users'
  end



end



run! if app_file == $0
end
