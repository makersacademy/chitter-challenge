require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = Peeps.all
    erb :index
  end

  post '/peep-params' do
    Peeps.create(content: params['peep_content'], time: Time.new)
    redirect '/post-successful'
  end

  get '/post-successful' do
    erb :post_successful
  end





  run! if app_file == $0
end
