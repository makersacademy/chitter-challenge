require 'sinatra/base'

# Class comment
class Chitter < Sinatra::Base
  # enable :sessions, :method_override
  get '/peep' do
    erb :index
  end

  post '/peep' do
    erb :index
    'my first peep'
  end
end
