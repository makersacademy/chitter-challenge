require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    redirect('/peeps')
  end

  get '/peeps' do
    erb :index
  end

  get '/peeps/add' do
    "What is your message?"
  end

  run! if app_file == $0

end
