# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'posting a message' do
  scenario 'user can post a message to chitter' do
    visit('/chitter/new')
    fill_in('text', with: 'This is my first peep!')
    fill_in('user_name', with: 'Bob')
    click_button('Submit')
    expect(page).to have_content('Bob - This is my first peep!')
  end
end