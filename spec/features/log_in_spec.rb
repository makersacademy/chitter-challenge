feature 'log in' do
  scenario 'the user is able to log in' do
    user = User.create(
      name: 'Example Name',
      username: 'exampleusername',
      email: 'example@example.com',
      password: 'examplepassword'
    )
    
    visit('/users/login')
    fill_in('username', with: user.username)
    fill_in('password', with: user.password)
    click_button('Submit')

    expect(current_path).to eq('/')
    expect(page).to have_content("Logged in as #{user.name}")
  end

  scenario 'the user is unable to login with incorrect password' do
    user = User.create(
      name: 'Example Name',
      username: 'exampleusername',
      email: 'example@example.com',
      password: 'examplepassword'
    )
    
    visit('/users/login')
    fill_in('username', with: user.username)
    fill_in('password', with: 'incorrectpassword')
    click_button('Submit')

    expect(current_path).to eq('/users/login')
    expect(page).to have_content("The username and password do not match.")
  end
end
