class Chitter < Sinatra::Base

  get '/' do
    redirect '/feeds/view' if current_user
    @user = User.new
    erb :index, layout: :layout_home
  end

end
