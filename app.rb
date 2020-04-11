require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/peeps' do
    peeps = [
          "What a day to peep!",
          " Happy Easter"
          ]

    erb :'peeps/index'
  end

end