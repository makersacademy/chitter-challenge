class Chittr < Sinatra::Base

  get '/' do
    erb :'/peeps/index'
  end

end
