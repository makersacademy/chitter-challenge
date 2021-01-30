require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/peeps' do
    "Hello world"
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(peep: params[:peep])
    redirect '/peeps'
  end

  run! if app_file == $0
end