class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = (params[:search] ? search(params[:search]) : Peep.all)
    erb :'peeps/index'
  end

  post '/peeps' do
    if params[:peep_content] != ""
      create_peep(params)
      redirect to('/peeps')
    else
      flash.now[:notice] = "Please enter a message for your peep"
      erb :'/peeps/new'
    end
  end

  get '/peeps/new' do
    if session[:user_id].nil?
      flash.now[:notice] = "You must be logged in to post a peep"
      redirect '/peeps'
    end
    erb :'peeps/new'
  end

  post '/peeps/delete' do
    Peep.get(params[:peep_id]).destroy
    flash.now[:notice] = "Peep deleted."
    redirect '/peeps'
  end

  get '/tags/:tag' do
    tag = Tag.first(name: params[:tag])
    @peeps = tag ? tag.peeps : []
    erb :'/peeps/index'
  end

  get '/peeps/reply' do
    @peep = Peep.get(params[:peep_id])
    erb :'/peeps/reply'
  end

  post '/peeps/reply' do
    @peep = Peep.get(params[:peep_id])
    reply = Reply.create(content: params[:content],
            created_at: Time.now,
            user: current_user,
            peep: @peep)
    @peep.replys << reply
    @replys = Reply.all(peep_id: @peep.id).reverse
    @replys = [] if @replys.nil?
    erb :'/peeps/peep'
  end

  get '/peeps/peep/:peep_id' do
    @peep = Peep.get(params[:peep_id])
    @replys = Reply.all(peep_id: @peep.id).reverse
    @replys = [] if @replys.nil?
    erb :'/peeps/peep'
  end

end
