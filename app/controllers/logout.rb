class Chitter < Sinatra::Base
  delete '/logout' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect to '/'
  end
end
