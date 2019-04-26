require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/home' do
    erb :home
  end

  get '/post' do
    erb :post
  end

  post '/home' do
    @peep = params[:peep]
    erb :home
  end

end
