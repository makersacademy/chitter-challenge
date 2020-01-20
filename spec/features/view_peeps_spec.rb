require 'chitter'
require 'database_helpers'

feature 'view peeps' do 
  scenario 'user can see all peeps on home page' do
    Chitter_Peep.post_peep(body: "My first peep", name: "Ben", handle: "squareben")
    Chitter_Peep.post_peep(body: "My second peep", name: "Sam", handle: "sam123")
    Chitter_Peep.post_peep(body: "My third peep", name: "Bob", handle: "bob123")
    visit('/')
    expect(page).to have_content "My first peep"
    expect(page).to have_content "My second peep"
    expect(page).to have_content "My third peep"
  end 
end 