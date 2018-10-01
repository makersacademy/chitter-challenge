class Chitter < Sinatra::Base
  delete '/logout' do
    session[:user_id] = nil
    flash.next[:notice] = 'Goodbye!'
    redirect to '/'
  end
end
