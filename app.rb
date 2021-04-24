require 'sinatra'
require 'sinatra/reloader'
require 'peep'

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

  post '/chitter/post_peep' do
    Peep.create(text: params[:text], user: params[:user])
    redirect('/chitter')
  end

end
