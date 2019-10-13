feature 'post peep' do
  it 'adds a new (peep) message to the board' do
    visit '/homepage'
    click_button 'New Post'

    fill_in 'content', with: 'This is a test post'
    click_button 'Submit'

    expect(page).to have_content('This is a test post')
  end

  it 'shows the user and user handle that posted the peep' do
    Users.create(name: 'name', username: 'user', email: 'user@user.com', password: 'password')

    visit '/homepage'
    click_button 'Sign in'

    fill_in 'email', with: 'user@user.com'
    fill_in 'password', with: 'password'
    click_button 'Sign in'

    click_button 'New Post'

    fill_in 'content', with: 'This is a test post'
    click_button 'Submit'

    expect(page).to have_content('This is a test post')
    expect(page).to have_content('name')
    expect(page).to have_content('username')
  end
end
