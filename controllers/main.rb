class Chitter < Sinatra::Base

  get '/' do
    redirect '/users/new'
  end

  get '/chitter-newsfeed' do
    @message = Message
    erb :chitter_newsfeed
  end

end
