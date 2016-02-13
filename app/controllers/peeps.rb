class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all(order: [ :created_at.desc ])
    erb :'peeps/index'
  end

  get '/peeps/new' do
    if current_user
      erb :'peeps/new'
    else
      flash.now[:errors] = ["Please sign in to peep"]
      erb :'sessions/new'
    end
  end

  post '/peeps' do
    current_user.peeps.create(message: params[:message], created_at: Time.now)
    redirect to '/peeps'
  end
end