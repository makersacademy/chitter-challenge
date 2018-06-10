feature 'Viewing peeps' do

  # User Story 2
  # As a maker
  # So that I can see what others are saying
  # I want to see all peeps in reverse chronological order
  scenario 'see all peeps in reverse chronological order' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Test name')
    fill_in('username', with: 'testusername')
    click_button('Submit')
    fill_in('peep', with: "This peep is very profound")
    fill_in('username', with: "Simone")
    click_button('Post')
    click_button('Write another peep')
    fill_in('peep', with: "This one is not, it is just a cat GIF")
    fill_in('username', with: "Simone")
    click_button('Post')
    expect("This one is not, it is just a cat GIF").to appear_before("This peep is very profound")
  end

  # User Story 3
  # As a Maker
  # So that I can better appreciate the context of a peep
  # I want to see the time at which it was made
  scenario 'see the time peeps were posted' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Test name')
    fill_in('username', with: 'testusername')
    click_button('Submit')
    fill_in('peep', with: "This peep should have a time stamp")
    fill_in('username', with: "Simone")
    click_button('Post')
    expect(page).to have_content("posted at: ")
  end
end
