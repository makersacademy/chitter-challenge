require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    @peep = Peep.create(message: params[:message])
    p @peep.time.strftime("Posted on %A at %I:%M %p")
    redirect "/peeps"
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  # establish server if file run directly
  run! if app_file == $0
end
