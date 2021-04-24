require 'sinatra'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  get '/' do
    redirect('/chitter')
  end

  get '/chitter' do
    erb(:index)
  end

  get '/chitter/post_peep' do
    erb(:'/chitter/post_peep')
  end

end
