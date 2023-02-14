require 'sinatra/base'
require 'sinatra/reloader'

require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/maker_repository'
require_relative 'lib/peep'
require_relative 'lib/maker'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository' #code copied - may need functionality check
    also_reload 'lib/maker_repository' #code copied - may require functionality check
  end


  get '/' do
    repo = PeepRepository.new
    @peeps = repo.all
      
    return erb(:peeps_all)
end


# Page: Chitter Homepage

## Request:
#GET /
#No parameters

# Response (200 OK)
#HTML view with list of pages (options)

# Page: see full entry 

## Request: 
#GET /peeps
#No parameters 

## Response (200 OK)
#HTML view of all peeps in reverse choronological order (showing contents, username, and timestamp)

## Request:
#GET /entries/:id
#With path parameter :id

## Response (200 OK)
#HTML view with details of a single entry#

# Page: post a new peep

## Request:
#GET /peeps/post
#No parameters

## Response (200 OK)
#HTML view with form to submit new peep (to POST /peeps)

# Page: new entry added

## Request:
#POST /peeps
#With parameters:
  #contents="What a great Sunday"
  #time="23/02/11 18:06:45"
  #username="angela123"

## Response (200 OK)
#HTML view with confirmation message

#context "GET/" do
  #it 'with 200 OK response index page welcomes user' do
    #response = get('/')

    #expect(response.status).to eq(200)
   # expect(response.body).to include('<h1><%=CHITTER CHATTER %></h1>')	
  #end



end

