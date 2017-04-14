class Ricker<Sinatra::Base
  
  get '/' do
    if session[:user_id]
     redirect '/rolls/index'
    else
      erb :home
    end
  end

end
