class Chitter < Sinatra::Base

  get '/peep/new' do
    user = session[:user_name]
    if user
      erb(:'peep/new')
    else
      redirect '/user/sign_in'
    end
  end

  post '/peep/new' do
    user = User.first(:user_name => session[:user_name])
    peep = user.peeps.create(content: params[:content])
    redirect '/feed'
  end

end
