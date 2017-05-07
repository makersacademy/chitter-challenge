class Chitter < Sinatra::Base

  get '/' do
    redirect '/users/new'
  end

  get '/chitter-newsfeed' do
    @messages = Message.all
    erb :chitter_newsfeed
  end

end
