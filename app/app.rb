require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    @post = params[:comment]
    erb(:home)
  end

end
