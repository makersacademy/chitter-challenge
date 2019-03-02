require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  post '/peeps' do
    session[:new_peep] = params[:body]
    @new_peep = session[:new_peep]
    erb :'peeps/view_peeps'
  end

  get '/peeps/new' do
    erb :'peeps/create_peeps'

  end

run! if app_file == $0
end
