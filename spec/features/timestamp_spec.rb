feature 'Timestamp' do
  scenario 'User can check what time a peep was posted' do
    sign_up
    visit '/posts/new'
    fill_in 'message', with: 'A first peep!'
    click_button 'Add Peep'
    expect(page).to have_content(Time.now.strftime(" at %I:%M%p on %m/%d/%Y"))
  end

  scenario 'User can see what time a peep was posted with peeps in database' do
    user = User.create( email: 'john@doe.com',
                        username: 'johndoe',
                        password: 'password',
                        password_confirmation: 'password')
    sign_in
    Peep.create(message: "Today's message", timestamp: Time.now, user_id: user.id )
    Peep.create(message: "Yesterday's message", timestamp: (Time.now - 86_400), user_id: user.id)
    visit '/posts'
    expect(page).to have_content "Message: Today's message posted by johndoe#{Time.now.strftime(" at %I:%M%p on %m/%d/%Y")} Message: Yesterday's message posted by johndoe#{(Time.now - 86_400).strftime(" at %I:%M%p on %m/%d/%Y")}"
  end

end
