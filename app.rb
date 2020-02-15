require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions
  get '/' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/post' do 
    erb :post
  end 

  post '/post' do 
    Peep.create(text: params['peep'])
    redirect '/'
  end 

end
