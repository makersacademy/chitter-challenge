class Chitter < Sinatra::Base

  get '/cheeps/new' do
    if current_user
      erb :"cheeps/new"
    else
      redirect to '/users/sign_in'
    end
  end

  post '/cheeps/new' do
    current_user.cheeps.create(content: params[:content])
    redirect to '/'
  end

end