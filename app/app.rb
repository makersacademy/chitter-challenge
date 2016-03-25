require 'sinatra/base'
require 'bcrypt'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/signup'
  end

  get '/signup' do
    erb :signup_page
  end

end
