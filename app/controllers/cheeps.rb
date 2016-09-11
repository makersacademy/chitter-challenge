class Chitter < Sinatra::Base

  get '/cheeps' do
    @cheeps = Cheep.all
    erb :'cheeps/home'
  end

  post '/cheeps' do
    user = current_user
    if user && !params[:body].empty?
      @cheep = user.cheeps.create(body: params[:body],
                                  created_at: Time.now,
                                  posted_by: user.name,
                                  handle: user.user_name)
      redirect '/cheeps'
    elsif  user && params[:body].empty?
      flash.now[:errors] = ["Where's your cheep?"]
      erb :'cheeps/new'
    else
      flash.now[:notice] = 'Please sign in or create an account'
      erb :'cheeps/new'
    end
  end

  get '/cheeps/new' do
    erb :'cheeps/new'
  end


end
