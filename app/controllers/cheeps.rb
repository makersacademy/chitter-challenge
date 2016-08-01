class Chitter < Sinatra::Base

  get '/cheeps/index' do
    @cheeps = Cheep.all

    erb :'cheeps/index'
  end

  get '/cheeps/new' do
    erb :'cheeps/new'
  end

  post '/cheeps/index' do
    user = User.first(id: session[:user_id])
    if user
      cheep = Cheep.new(content: params[:content])
      cheep.user = user
      user.save
      cheep.save
      redirect '/cheeps/index'
    else

    end
  end

end