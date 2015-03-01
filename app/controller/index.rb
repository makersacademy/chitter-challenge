class ChitterApp < Sinatra::Base

  get '/' do
    #Problem: If you enter wrong email/pw and return to index page
    #the message still shows becasue flash is in the layout view.
    #Solution: Was to set all flash to nil
    #Question: Is there a better way to clear the message out?
    flash[:notice] = nil
    flash[:errors] = nil
    erb :index
  end

end
