class BookmarkManager < Sinatra::Base
enable :sessions
register Sinatra::Partial
set :partial_template_engine, :erb

end
