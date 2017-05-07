class Chitter < Sinatra::Base

  get '/' do
    redirect '/chitter-newsfeed'
  end

  get '/chitter-newsfeed' do
    @messages = Message.all
    erb :chitter_newsfeed
  end

end
