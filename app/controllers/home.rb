class Chitter < Sinatra::Base
  get '/' do
    erb :'home/index'
  end
end
