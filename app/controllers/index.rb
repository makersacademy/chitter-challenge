class Chitter < Sinatra::Base

  get '/' do
    erb :index, layout: :home_layout
  end

end
