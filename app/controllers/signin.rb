class Chitter < Sinatra::Base

  get '/signin' do
    erb :'/signin'
  end

  post '/signin' do
    username = params['username']
    password = params['password']
    if user = User.authenticate(username, password)
      session['id'] = user.id
      redirect '/'
    else
      login_error
      erb :'/signin'
    end
  end

end
