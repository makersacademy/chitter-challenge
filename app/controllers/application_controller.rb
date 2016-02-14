
class Chitter < Sinatra::Base

  set :public_folder, File.dirname(__FILE__) + '/static'

end
