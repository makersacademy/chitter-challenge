require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/peeps' do
    "What a day to peep! Happy Easter"
  end

end