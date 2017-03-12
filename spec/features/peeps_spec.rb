require 'helpers'

# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'Peeps' do
  scenario 'I can post peeps' do
    create_user
    sign_in(email: 'noora@example.com', password: 'password')#redirects to index with sign in button which redirects to sessions/new
    visit '/peeps/new'
    fill_in :peep, with: 'This is my first peep!'
    click_button 'Post'
    expect(page).to have_content('This is my first peep!')
  end
end
