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
    fill_in('username', with: "Simone")
    click_button('Post')
    expect(page).to have_content "My first peep"
  end

  scenario 'a peep cannot be more than 140 characters long' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Test name')
    fill_in('username', with: 'testusername')
    click_button('Submit')
    fill_in('peep', with: "This peep is way too long, and I'm expecting to \
      receive an error message for trying to post it. It just goes on, and on, \
      and on, and on.......")
    fill_in('username', with: "Simone")
    click_button('Post')
    expect(page).to have_content("That's too long, be more concise!")
  end
end
