feature 'New peep' do 
  scenario 'create a new post and see it on the page' do 
    # create new user
    visit('users/new')
    fill_in('name', with: "test")
    fill_in('username', with: "testing")
    fill_in('password', with: "password123")
    fill_in('email', with: "test@email.com")
    click_button "Submit"

    # Write peep and see it appear
    fill_in('peep', with: "Hello this is my first peep")
    click_button "Post"
    expect(page).to have_content "Hello this is my first peep"
  end
end