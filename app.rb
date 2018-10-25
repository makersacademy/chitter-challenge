require 'sinatra/base'

class Chitter < Sinatra::Base
  set :port, 6789

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    erb(:"peeps/index")
  end

  get '/peeps/new' do
    erb(:"peeps/new")
  end

  run! if app_file == $0
end
