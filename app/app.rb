require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/posts' do
    erb(:posts)
  end

end
