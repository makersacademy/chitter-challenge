ENV['RACK_ENV'] ||= 'development'

require './app/models/peep.rb'
require './app/models/user.rb'
require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :session

  get '/signin' do
    erb(:signin)
  end



  post '/newuser' do
    if User.first(params[:email])
      redirect '/exist'
    end
    User.create(email: params[:email], password: params[:password])
    redirect '/login'
  end

  get '/exist' do
    erb(:exist)
  end

  get '/login' do
    erb(:login)
  end

  post '/newpeep' do
    if User.get(params[:emaillog])
      redirect "/newpeep/#{params[:emaillog]}"
    else
      erb(:notexist)
    end
  end

  get '/newpeep/:name' do
    erb(:newpeep)
  end

  post '/peep' do
    Peep.create(message: params[:message], time: Time.new)
    redirect '/peep'
  end

  get '/peep' do
    @peep = Peep.all
    @user = User.all
    erb(:peep)
  end
end
