class Chitter < Sinatra::Base

  get '/' do
    redirect '/peeps'
  end


end
