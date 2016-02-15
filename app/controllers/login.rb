class Chitter < Sinatra::Base

  get '/' do
    redirect '/users/new'
  end
  
end