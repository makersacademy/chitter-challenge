require 'sinatra/base'
#require './lib/user.rb'

class Chitter < Sinatra::Base

    get '/'do 
      "Chitter - Home"
      erb :index
    end

    get '/register/new' do
      erb :'register/new'
    end

    post '/register/new' do
      redirect '/success'
    end

    get '/success' do
      erb :success
    end

    get '/peeps' do 
      erb :peeps
end