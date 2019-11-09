require 'sinatra/base'
require './lib/peeps'



class ChitterManager < Sinatra::Base
  get '/' do
    "Hello World"
  end

  get '/peeps/post' do
    erb :'peeps/post'
  end

  post '/peeps' do
    Hello Word
  end


  run! if app_file == $0

end
