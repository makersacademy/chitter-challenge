module Helpers

  def current_user
    session[:user]
  end

 def current_time
   time = Time.new
   if time.min < 10
     min = "0#{time.min}"
   else
     min = time.min
   end
   "#{time.hour}:#{time.min}"
 end
 
end
