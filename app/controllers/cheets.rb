class Chitter < Sinatra::Base

  get '/' do
    @cheets = Cheets.all
    erb :cheets
  end

end
