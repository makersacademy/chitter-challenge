require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'Welcome to Chitter'
  end

  get '/peeps' do
    @peeps = Peep.all

    erb :'index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

run! if app_file == $0
end
