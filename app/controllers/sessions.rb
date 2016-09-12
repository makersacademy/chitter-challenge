class ChitterApp < Sinatra::Base

  get '/sessions' do
    erb :'sessions/signin'
  end

end
