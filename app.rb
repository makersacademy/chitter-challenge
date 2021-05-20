require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

get '/' do
  @peeps = ['Message 1', 'Message 2']
  @peeps << session[:peep]
  erb(:index)  
end

post '/' do
  session[:peep] = params['peep']
  redirect('/')
end

end
