require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/user'
require_relative './lib/peep'

class Chitter < Sinatra::Base

  register Sinatra::Flash
  enable :sessions

  get '/' do
    erb :index
  end

  post '/welcome' do
    User.create(name: params[:name], username: params[:name], email: params[:email], password: params[:password])
    user = User.all.select{ |user| user.name == params[:name] }.first
    @name = user.name
    erb :welcome
  end

  get '/post' do
    erb :post
  end

  post '/post' do
    Peep.create(params[:peep])
    flash[:post] = "Peep posted"
    redirect '/post'
  end

  run! if app_file == $0

end
