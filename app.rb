require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Message.all
    erb(:homepage)
  end

  get '/peep/new' do
    erb(:'peeps/new')
  end

  post '/peep/new' do
    redirect '/'
  end

  run if app_file == $0

end
