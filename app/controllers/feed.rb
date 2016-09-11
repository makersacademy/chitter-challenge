class Chitter < Sinatra::Base

  get '/feed' do
    @user_name = session[:user_name]
    erb(:feed)
  end

end
