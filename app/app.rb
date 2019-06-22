require 'sinatra'

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
    session[:peep] = @peep
    redirect '/peeps'
  end

  get '/peeps' do
    @peep = session[:peep]
    erb :peeps
  end

  run! if app_file == $0

end
