require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :home
  end

  get '/peeps' do
    erb :'/peeps/index'
  end

  post '/peeps' do
    redirect '/peeps'
  end

  run! if app_file == $0
end
