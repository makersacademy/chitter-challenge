require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    erb :'/peeps/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
