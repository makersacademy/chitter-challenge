class Chitter < Sinatra::Base

  get '/' do
    erb :'/peeps/latest'
  end

end
