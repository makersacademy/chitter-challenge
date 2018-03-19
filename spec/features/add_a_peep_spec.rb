feature "You can add a peep" do

  scenario "The user adds a peep" do
    User.create('George', 'test@example.com', 'password123')

    visit('/')
    click_button('Sign in')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign in')
    fill_in('Comment_box', with: 'My first peep')
    click_button('Submit')
    expect(page).to have_content('My first peep')
  end

end
