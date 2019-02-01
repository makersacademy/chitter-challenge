require 'pg'

#
# feature 'Posting a message to chitter' do
# end

feature 'Testing infrastructure' do
    scenario 'It should visit main page and display - Welcome to Chitter' do
    visit ('/')
    expect(page).to have_content "Welcome to Chitter!"
  end
end



#  Peeping - post message
#  Listing Peeps - newest first (reverse chronological order)
#  Display time of peep
#  Sign up

#Log in
# Log out

#tagged in peep - receive email
