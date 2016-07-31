
class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    @peeps.sort_by &:created_at
    erb :'peeps/index'
  end

  post '/peeps/new' do
    current_user.peeps.create(message: params[:message])
    redirect to('/peeps')
  end

end
