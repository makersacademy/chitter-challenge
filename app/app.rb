require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/users/new' do
    erb :'users/signup'
  end

  post '/users' do
    redirect to '/peeps'
  end

  get '/peeps' do

  end
end
