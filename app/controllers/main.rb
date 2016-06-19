class Chitter < Sinatra::Base
  get "/" do
    erb(:"peep/index")
  end
end
