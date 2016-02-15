class ChitterApp < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps/index'
  end

  get '/peeps/new' do
    if current_user
      erb :'/peeps/new'
    else
      flash.keep[:errors] = ['Please sign in to post a peep.']
      redirect to('/peeps')
    end
  end

  post '/peeps/new' do
    Peep.create(
      message: params[:message],
      datetime: Time.now,
      user: current_user)
    redirect to('/peeps')
  end

  post '/peeps/reply' do
    session[:peep_id] = params[:peep_id]
    redirect to('/peeps/newreply')
  end

  get '/peeps/newreply' do
    @peeps = [Peep.get(session[:peep_id])]
    erb :'/peeps/newreply'
  end

  post '/peeps/newreply' do
    Reply.create(
      message: params[:message],
      datetime: Time.now,
      user: current_user,
      peep: Peep.get(session[:peep_id]))
    session[:peep_id] = nil
    redirect to('/peeps')
  end
end
