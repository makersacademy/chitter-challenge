class Chitter < Sinatra::Base
  get '/peeps' do
    erb :'peeps/new'
  end

  post '/peeps/new' do
    peep = Peep.create(content: params[:post], time: Time.now)
    @user = current_user
    @user.peeps << peep
    @user.save!
    @users = User.all
    erb :'peeps/index'
  end

 delete 'peeps' do
#   @user = current_user
#   peep = params[:peep]
#   PeepUser.all(peep_id: peep.id)
#   @user.peeps.all(peep: peep.id).destroy
#   peep.destroy
#   @user.reload
#  redirect '/peeps'
 end
end 
