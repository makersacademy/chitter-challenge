require 'pry'

class Chitter < Sinatra::Base

  get '/wall' do
    puts current_user
    erb :wall
  end

  get '/logout' do
    "Goodbye"
    erb :logout
  end

end
