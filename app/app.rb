require 'sinatra'

class Chitter < Sinatra::Base
  get '/' do
    'Chitter - Speak Your Mind'
  end

  get '/peeps/new' do    
    erb :'peeps/new'    
  end

  post '/peeps' do
    @content = params[:content]
    # redirect '/peeps'
  end

  run! if app_file == $0

end
