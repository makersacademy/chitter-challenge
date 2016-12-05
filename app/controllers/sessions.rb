class Chitter < Sinatra::Base

  delete '/sessions' do
    session[:id] = nil
    flash.keep[:notice] = "Goodbye!"
    @posts = Peep.all
    redirect("/peeps")
  end

end
