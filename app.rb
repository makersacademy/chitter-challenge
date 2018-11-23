require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peeps.all
    erb :index
  end

  post '/peep-params' do
    session[:peep_content] = params[:peep_content]
    redirect '/post-successful'
  end

  get '/post-successful' do
    @users_peep = session[:peep_content]
    erb :post_successful
  end





  run! if app_file == $0
end
