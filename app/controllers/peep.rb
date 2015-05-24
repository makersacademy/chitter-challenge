require_relative '../helpers/application'
include CurrentUser


post '/peeps' do
  if current_user
    @peep = Peep.create(:content => params[:peep])
    redirect to('/')
  else
    flash[:errors] = ['You must be logged in to post a peep']
    erb :'sessions/new'
  end
end


