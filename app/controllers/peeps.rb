class ChitterChallenge < Sinatra::Base

  get '/' do
    redirect to('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    current_user.peeps << Peep.create(text: params[:peep])
    current_user.save
    redirect '/peeps'
  end

  post '/peeps' do
    if current_user
        Peep.create(user: current_user,
        text: params[:peep],
        posted_at: Time.now)
        redirect to('/peeps')
    elsif params[:peep]
      flash.keep[:errors] = "You must be signed in to peep"
    end
  end

end
