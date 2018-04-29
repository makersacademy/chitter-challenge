feature "sign up  & sign in & peep" do
  scenario 'sign in page content' do
    visit '/'
    find_button('Sign in').click
    expect(page).to have_field 'username'
    expect(page).to have_field 'password'
    expect(page).to have_button 'log in'
    expect(page).to have_button 'Sign up'
  end

  scenario 'sign up' do
    visit '/sign-up'
    fill_in('name', :with => 'feature test')
    fill_in('email', :with => 'FT@mail.com')
    fill_in('username', :with => 'ft')
    fill_in('password', :with => 'ffttfft')
    find_button('Sign up').click
    expect(page).to have_content 'Sign up successful! Now sign in and CHITTER!!'
  end

  scenario 'sign in' do
    user = User.create(name: 'ft', email: 'def@gmail.com', username: 'abe', password: 'ffttfft')
    visit '/sign-in'
    fill_in('username', :with => user.username)
    fill_in('password', :with => 'ffttfft')
    find_button('log in').click
    expect(page).to have_content "Hi #{user.name.upcase}! It's peep time!"
    expect(current_path).to eq "/user/abe"
  end

  scenario 'peep' do
    user = User.create(name: 'aaa', email: 'aaa@gmail.com', username: 'Aaa', password: 'asdf')
    visit '/sign-in'
    fill_in('username', :with => user.username)
    fill_in('password', :with => 'asdf')
    find_button('log in').click
    fill_in('message', :with => 'pe pe peepepepep')
    find_button('Peep!').click
    expect(page).to have_content 'pe pe peepepepep'
  end

  scenario 'log out' do
    visit '/sign-in'
    fill_in('username', :with => 'ft')
    fill_in('password', :with => 'ffttfft')
    find_button('log in').click
    find_button('Sign out').click
    expect(page).not_to have_content "Hi FEATURE TEST! It's peep time!"
  end

end
