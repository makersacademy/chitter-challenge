require 'sinatra/base'
require 'sinatra/reloader'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override

  get '/' do
    $peeps
    erb :'index'
  end

  post '/peep' do
    $peeps = params[:messsage]
    redirect '/'
  end
end