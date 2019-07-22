require 'sinatra/base'
require_relative './lib/message'
require_relative './lib/user'

# require_relative 'chitter'

class ChitterManager < Sinatra::Base

  get '/' do
    erb :"index"
  end

  get '/welcome' do
    erb :"welcome/index"
  end

  get '/peeps' do
    @peeps = Message.all
    erb :"peeps/index"
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Message.post(message: params[:message])
    redirect '/peeps'
  end

  post '/users' do
    User.create(email: params[:email], password: params[:password])
    redirect '/welcome'
  end

  run! if app_file == $0

end
