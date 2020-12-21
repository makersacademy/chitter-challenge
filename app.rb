require 'sinatra/base'

class Chitter < Sinatra::Base
  post '/users' do
    $user = params[:user_name]
    redirect '/users/1'
  end

  get '/users/1' do
    erb :'/users/show'
  end

  get '/users/new' do
    erb :'users/new'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    @peep = Peep.create(message: params[:message])
    redirect "/peeps"
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  # establish server if file run directly
  run! if app_file == $0
end
