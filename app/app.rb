require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb(:signup_login)
  end

end
