require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :'start'
  end

  post '/chitter' do
    @peep = params['content']
    erb :'/index'
  end


  run! if app_file == $0
end
