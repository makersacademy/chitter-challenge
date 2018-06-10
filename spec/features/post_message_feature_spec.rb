# User Story 1
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Post a peep to Chitter' do
  scenario 'user can write a peep and post it' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Test name')
    fill_in('username', with: 'testusername')
    click_button('Submit')
    fill_in('peep', with: "My first peep")
    click_button('Post')
    expect(page).to have_content "My first peep"
  end
end
