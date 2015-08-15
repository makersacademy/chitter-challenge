require 'sinatra/base'
require_relative 'data_mapper_setup'
class Chitter < Sinatra::Base

  get '/' do
    redirect to('/peeps/new')
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
   erb :'peeps/new'
  end

  post '/peeps' do
   Peep.create(content: params[:new_peep])
   redirect to('/peeps')
  end

  get '/users/new' do
    @user = User.new  # nb: this is to store the values in the form in case of unsuccessful registration
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(username: params[:username], name: params[:name], email: params[:email], password: params[:password])
    redirect to('/users')
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
