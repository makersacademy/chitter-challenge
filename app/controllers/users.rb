class Chitter < Sinatra::Base
  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.new(params)
    if user.save
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.next[:errors] = user.errors.full_messages
      flash.next[:email] = user.email
      redirect to('/users/new')
    end
  end
end
