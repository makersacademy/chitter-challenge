class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb(:"peeps/peeps")
  end

  post '/peeps' do
    current_user
    peep = current_user.peeps.new(peep: params[:peep])
    if peep.save
        flash.now[:notice] = ["Peep was created created"]
        redirect to("/peeps")
    else
        flash.now[:notice] = ["Peep could not be created"]
        erb(:"users/user")
    end
  end

  get '/peeps/:id' do
    @peep = Peep.get(params[:id])
    @comments = @peep.comments.reverse
    erb(:"peeps/peep")
  end

end
