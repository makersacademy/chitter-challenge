class Chitter < Sinatra::Base
  delete '/logout' do
    session.clear
    redirect to '/'
  end
end
