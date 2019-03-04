feature 'logout from chitter' do
  scenario 'maker can logout from chitter' do
    build_maker
    visit '/'
    expect(page).to have_content 'Welcome to Chitter!' and 'OR'
    expect(page).to have_button('View all Peeps')
    expect(page).to have_button('Signup')
    expect(page).to have_button('Login')
    expect(page).to have_content "to post a peep!"
    click_button 'Login'
    expect(current_path).to eq '/chitter/login'
    fill_in :email, with: 'joebloggs@gmail.com'
    fill_in :password, with: 'password'
    click_button 'Submit'
    expect(page).to have_button('view all peeps')
    expect(page).to have_button('create a peep')
    expect(page).to have_content 'Welcome to Chitter Joe Bloggs' and 'What would you like to do?'
    expect(current_path).to eq '/chitter/maker/homepage'
    click_button 'create a peep'
    expect(current_path).to eq '/chitter/peep/new'
    fill_in 'message', with: 'This is a new peep'
    click_button 'Submit'
    expect(page).to have_content 'This is a new peep'
    expect(current_path).to eq '/chitter/peep/all'
    expect(page).to have_button('back to homepage')
    click_button 'back to homepage'
    expect(page).to have_content 'Welcome to Chitter Joe Bloggs' and 'What would you like to do?'
    expect(current_path).to eq '/chitter/maker/homepage'
    expect(page).to have_button('Logout')
    click_button 'Logout'
    expect(page).to have_content 'Welcome to Chitter!' and 'OR'
    expect(page).to have_button('View all Peeps')
    expect(page).to have_button('Signup')
    expect(page).to have_button('Login')
    expect(page).to have_content "to post a peep!"
    expect(current_path).to eq '/'

  end
end
