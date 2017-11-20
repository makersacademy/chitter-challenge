class App < Sinatra::Base
  get '/users/new' do
    erb(:'users/new', locals: { user: User.new })
  end

  post '/users' do
    user = User.new(name: params[:name], password: params[:password],
                    password_confirmation: params[:confirmation], 
                    email: params[:email], handle: params[:handle])
    if user.save
      session[:user_id] = user.id
      redirect('/peeps')
    else
      user.errors.send(:errors).each do |item, error| 
        flash[item] = error.first
      end
      erb(:'users/new', locals: { user: user })
    end
  end
end
