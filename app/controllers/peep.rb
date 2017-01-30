class Chitter < Sinatra::Base
  get '/peep' do
    erb :'peep/index'
  end

  post '/peep/post' do
    user = User.get(session[:user_id])
    Peep.create(:user => user, :message => params[:peep])
    flash.keep[:notice] = "Your Peep has been posted"
    redirect '/'
  end
end
