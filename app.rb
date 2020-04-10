require 'sinatra'
class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb(:index)
  end

  get '/users/new' do
    erb(:signup)
  end
  post '/users/' do
    redirect '/'
  end
end