feature "Messaging" do
  scenario "A user can create a message" do
    # visit '/messages'
    # fill_in('message', with: 'Test message')
    # click_button('Create message')
    visit '/'
    click_button 'Create new account'

    expect(current_path).to eq '/users/new'
    fill_in('username', with: "username")
    fill_in('password', with: "password")
    click_button('Create account')

    expect(page).to have_content 'Test message'
    expect(page).not_to have_content 'error'
  end

  scenario "A mesage can have a time posted" do
    # visit '/messages'
    # fill_in('message', with: 'Test message')
    # click_button('Create message')
    visit '/'
    click_button 'Create new account'

    expect(current_path).to eq '/users/new'
    fill_in('username', with: "username")
    fill_in('password', with: "password")
    click_button('Create account')

    expect(page).to have_content "#{Time.now.strftime(":Posted at %H:PM %A")}"
  end
end