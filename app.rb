require 'sinatra/base'


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
end