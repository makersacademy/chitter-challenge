class ChitterApp < Sinatra::Base

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
    else
      flash[:errors] = ['Login details incorrect']
    end
    redirect '/peeps'
  end

end
