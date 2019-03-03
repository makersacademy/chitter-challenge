require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :home
  end

  post '/peeps' do
    redirect('/')
  end

  run! if app_file == $0

end
