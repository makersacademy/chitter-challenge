require 'sinatra/base'

class Chitter < Sinatra::Base
enable :sessions

 get '/chitter' do 
  @new_peep = params[:peep]
  erb :index
 end 

 run! if app_file == $0

end 

# <!DOCTYPE html>
 
# <html>
#   <head>
#     <meta charset="utf-8">
#     <meta http-equiv="X-UA-Compatible" content="IE=edge">
#     <title>Chitter Chatter</title>
#     <meta name="viewport" content="width=device-width, initial-scale=1">
#     <link rel="stylesheet" href="">
#   </head>
#   <body
    
#     <script src="" async defer></script>
#   </body>
# </html>

    