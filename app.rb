require 'sinatra'

# The main Chitter class for the app
class Chitter < Sinatra::Base
  enable :sessions

  # test page
  get '/test' do
    'Test page. Web infrastructure working'
  end

  get '/' do
    @peep = session[:peep]
    erb :index
  end

  post '/peeps' do
    session[:peep] = params[:peep]
    redirect '/'
  end

end
