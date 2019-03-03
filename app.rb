require 'sinatra/base'
# require './lib/class'

class Chitter < Sinatra::Base

  get '/' do
    "Welcome to Chitter!"
  end


  get '/peeps' do
    @peeps = [
      "Hey, it's the weekend! ",
       "Hey, we're students at Makers! "]
    erb :'peeps/index'
  end


  get '/peeps/post' do
    erb :'peeps/post'
  end

  post '/peeps' do
    redirect '/peeps'
  end




  run! if app_file == $0
end
