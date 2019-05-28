require 'sinatra/base'
require './lib/chitter'

class ChitterFeed < Sinatra::Base

  # enable :method_override

  get '/' do
    @chitter_feed = Chitter.all
    erb :index
  end

  get '/new_peep' do
    erb :new_peep
  end

  post '/new_peep/add' do
    Chitter.create(message: params[:message])
    p params
    redirect '/'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up/welcome' do
    Chitter.sign_up(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    p params
    redirect '/'
  end

end