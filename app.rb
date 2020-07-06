require 'sinatra/base'
require 'pg'

class Chitter < Sinatra::Base
  get '/new' do
    erb :new_peep
  end

  post '/posted' do
    erb :thanks
  end
end