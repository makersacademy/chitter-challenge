require 'sinatra/base'

class ChitterApp < Sinatra::Base
  enable :sessions, :method_override

  # Returns list of peeps
  get '/' do
    @peep = session[:peep]
    erb :'peeps/index'
  end

  # Form to submit peep
  get '/peeps/new' do
    erb :'peeps/new'
  end

  # Submit peep
  post '/peeps' do
    session[:peep] = params[:peep]
    redirect '/'
  end
end
