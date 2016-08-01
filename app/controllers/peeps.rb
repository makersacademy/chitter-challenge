class Chitter < Sinatra::Base

  get '/' do
    'Welcome to Chitter!'
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
    user = User.get(session[:user_id])
    time = Time.new
    post_time = time.strftime("Posted on %d/%m/%Y, at %I:%M%p")
    peep = Peep.create(peep: params[:peep], author:
    user.user_name, time: post_time)
    peep.user << user
    peep.save
    redirect '/peeps'
  end
end
