require 'sinatra/base'

class Cheeter < Sinatra::Base


  get '/' do
    erb :index
  end

  post '/first_peep' do
    @peep = params[:peep]
    erb :add_post
  end

end
