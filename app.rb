require 'sinatra'
require './lib/peep'
class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb(:index)
  end

  get '/users/new' do
    erb(:signup)
  end
  post '/users/' do
    p params
    redirect '/'
  end
  get '/peeps/new' do
    erb(:new_peep)
  end

  post '/peeps' do
    message = params['peep text']
    person = params['username']
    Peep.create(text: message, user: person) 
    redirect '/'
  end
end