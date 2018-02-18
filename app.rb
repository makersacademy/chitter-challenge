require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require 'Time'

class Chitter < Sinatra::Base
enable :sessions

  get '/' do
    @user = User.get(session[:user_id])
    @peeps = Peep.all.reverse
    erb (:index)
  end

  post '/add-peep' do 
    Peep.create(content: params[:new_peep],  time: Time.now)
    redirect '/'
  end

  get '/sign-in' do 
    erb(:sign_in)
  end

  post '/new-user' do 
    @user = User.create(name: params[:Name], email: params[:Email], password: params[:Password])
    session[:user_id] = @user.id
    redirect '/'
  end

  run! if app_file == $0
end