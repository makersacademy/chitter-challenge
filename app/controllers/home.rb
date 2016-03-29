class Chitter < Sinatra::Base
  get '/' do
    erb :home
  end
end
