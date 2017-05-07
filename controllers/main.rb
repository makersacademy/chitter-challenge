class Chitter < Sinatra::Base

  get '/' do
    redirect '/users/new'
  end

  get '/chitter-newsfeed' do
    erb :newsfeed
  end

end
