require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = ['Hello', ' This is my second peep']
    erb :'peeps/index'
  end

  run! if app_file ==$0

end
