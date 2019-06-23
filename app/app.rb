require 'sinatra'
require './lib/peep'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    'Chitter - Speak Your Mind'
  end

  get '/peeps/new' do    
    erb :'peeps/new'    
  end

  post '/peeps' do
    @peep = Peep.create(content: params[:content])
    redirect '/peeps'
  end

  get '/peeps' do     
    @peeps = Peep.order_by_date 
    erb :'peeps/index'
  end

  run! if app_file == $0

end
