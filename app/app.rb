require 'sinatra/base'
require_relative 'models/user'
require_relative 'models/peep'


class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(
      username: params[:username],
      email: params[:email],
      password: params[:password])
    redirect to '/peeps'
  end

  run! if app_file == $0

end