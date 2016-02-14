class Chitter < Sinatra::Base

  delete '/signout' do
    session.delete(:id)
    flash.keep[:notice] = 'Goodbye!'
    redirect '/'
  end


end
