require 'sinatra/base'
require_relative 'models/peep'
class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.create(message: params[:message], time_posted: Time.now)
  redirect to '/peeps'
  end

  get '/' do
    erb :index
  end

  post '/users' do
    user = User.create(name: params[:name], user_name: params[:user_name], password: params[:password])
    redirect to '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

end
