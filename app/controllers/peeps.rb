class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all(order: [:id.desc])
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.new(content: params[:content],
                    time: DateTime.now)
    if current_user
      current_user.peeps << peep
      if peep.save
        redirect '/'
      else
        flash.now[:errors] = ['Your peep must be between 1 and 140 characters']
        erb :'peeps/new'
      end
    else
      flash.now[:errors] = ['You must be logged in to peep!']
      erb :'peeps/new'
    end
  end
end
