require 'pg'

feature 'Viewing Chitter Homepage' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter Homepage"
  end
end

# feature 'Viewing Peep Timeline' do
#   scenario 'a user can view peeps' do
#     # Peep.create(peep: "Hello World!")
#     # Peep.create(peep: "Monday again :(")
#     # visit('/timeline')
#     # expect(page).to have_content ("Hello World!")
#     # expect(page).to have_content ("Monday again :(")
#   end
# end
