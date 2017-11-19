require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions
  get '/peeps/new' do
    erb :'peeps/new'
  end

  post'/peeps/index' do
    session[:content] = params[:content]
    redirect '/peeps'
  end

  get '/peeps' do
    @content = session[:content]
    erb :'peeps/index'
  end


end
