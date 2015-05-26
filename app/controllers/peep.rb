require_relative '../helpers/application'
include CurrentUser


post '/peeps' do
  if current_user
    text = params[:peep]
    user = session[:user_id]
    @peep = Peep.create(user_id: user,
                        content: text)
    redirect to('/')
  else
    flash[:errors] = ['You must be logged in to post a peep']
    erb :'sessions/new'
  end
end

