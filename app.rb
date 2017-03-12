require 'sinatra/base'

class ChitterApp < Sinatra::Base
  enable :sessions #not yet needed.

  get '/' do
    redirect '/post-peep'
  end

  get '/post-peep' do
    erb :post_peep
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
