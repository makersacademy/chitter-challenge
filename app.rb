require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions
  
  get '/' do
    erb(:index)
  end

  post'/peeps' do
    @peep = params[:message]
    session[:message] = @peep
    redirect '/peeps'
  end

  get '/peeps' do
    @peep = session[:message]
    erb(:peeps)
  end

end
