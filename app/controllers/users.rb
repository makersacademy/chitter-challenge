class Chitter < Sinatra::Base

  get '/users/sign-up' do
    erb :'users/new'
  end

  post '/users/sign-up' do
    user = User.create(email: params[:email], password: params[:password],
                      password_confirmation: params[:password_confirmation])
    if user.save
      redirect '/'
    else
      flash[:notice] = user.errors.full_messages.join('\n')
      redirect '/users/sign-up'
    end
  end

end
