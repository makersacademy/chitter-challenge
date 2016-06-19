class Chitter < Sinatra::Base
  get '/logout' do
    session.clear
    redirect to '/'
  end
end
