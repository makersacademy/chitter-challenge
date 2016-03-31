class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all(order: [:id.desc])
    erb :'peeps/index'
  end

  post '/peeps' do
    peep = Peep.new(content: params[:content],
                    time: DateTime.now)
    if current_user
      current_user.peeps << peep
      can_save peep
    else
      flash.now[:errors] = ['You must be logged in to peep!']
      erb :'peeps/new'
    end
  end

  post '/peeps/remove' do
    peep = Peep.get(params[:id])
    peep.destroy
    redirect '/'
  end

  get '/peeps/:search' do
    @peeps = Peep.all(:content.like => "%#{params[:query]}%")
    erb :'peeps/index'
  end
end
