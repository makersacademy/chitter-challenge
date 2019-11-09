require 'sinatra/base'
require './lib/peeps'



class ChitterManager < Sinatra::Base
  get '/' do
    "*&"
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :'peeps/index'
  end

  get '/peeps/post' do
    erb :'peeps/post'
  end

  post '/peeps' do
    Peeps.create(text: params['new_peep'])
    redirect('/peeps')
  end


  run! if app_file == $0

end
