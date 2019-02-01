require 'pg'


feature 'Testing infrastructure' do
    scenario 'It should visit main page and display - Welcome to Chitter' do
    visit ('/')
    expect(page).to have_content "Welcome to Chitter!"
  end
end

feature 'Posting messages' do
  scenario 'Messages should be posted and displayed on first page' do
    visit ('/')
    fill_in('message', with: 'my first chitter!')
    click_button('chitter!')
    expect(page).to have_content "my first chitter!"
  end
end



#  Peeping - post message
#  Listing Peeps - newest first (reverse chronological order)
#  Display time of peep
#  Sign up

#Log in
# Log out

#tagged in peep - receive email
