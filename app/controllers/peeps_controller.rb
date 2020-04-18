class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all.sort_by(&:created_at).reverse! 
    erb :'peeps/index'
  end

  get '/peeps/new' do
    if @current_user 
      erb :'peeps/new'
    else 
      flash[:notice] = 'You must be signed in to post a peep'
      redirect '/users/login'
    end
  end

  post '/peeps/new' do
    @current_user.peeps.create(peep_params)
    redirect '/peeps'
  end

  get '/peeps/:id/edit' do
    @peep = Peep.find(params[:id])
    erb :'peeps/edit'
  end

  patch '/peeps/:id' do
    peep = Peep.find(params[:id])
    peep.update(peep_params)
    redirect '/peeps'
  end

  delete '/peeps/:id' do
    peep = Peep.find(params[:id])
    peep.destroy
    redirect '/peeps'
  end

  helpers do
    def date_and_time(created_at)
      created_at.strftime("%e %b %Y %k:%M")
    end
  end

  private

  def peep_params
    { body: params[:body] }
  end
end
