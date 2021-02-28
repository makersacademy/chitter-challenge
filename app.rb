require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :method_override
  
  get '/' do
    "Welcome to Chitter!"
  end

  get '/peeps' do
    erb :peeps
  end
      
  get '/peeps/new' do
    erb :'/peeps/new'
  end

  post '/peeps' do
    redirect '/peeps'
  end

  run! if app_file == $0
end
