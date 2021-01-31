require 'sinatra'

# The main Chitter class for the app
class Chitter < Sinatra::Base
  enable :sessions

  # test page
  get '/test' do
    'Test page. Web infrastructure working'
  end

  get '/' do
    erb :index
  end

  post '/peeps' do
    @peep = params[:peep]
    erb :peeps
  end

end
