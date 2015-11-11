class Chitter < Sinatra::Base
  get '/peeps/index' do
    @username = current_user ? current_user.username : nil
    @peeps = Peep.formatted
    erb(:'/peeps/index')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps/new' do
    if current_user
      peep = Peep.create(text: params[:text])
      current_user.peeps << peep
      current_user.save
      flash.next[:notice] = "Posted!"
    else
      flash.next[:errors] = ['Must be signed in to peep']
    end
    redirect to('/peeps/index')
  end
end
