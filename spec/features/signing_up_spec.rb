feature 'user registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('username', with: 'test12')
    click_button('Sign me up')

    expect(page).to have_content 'Welcome test12'
  end

  scenario 'a user can get to sign up page from peeps page' do
    visit '/peeps'
    click_link('Sign up')
    
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Sign up here to join Chitter'
  end

  scenario 'a user can get to sign in page from peeps page' do
    visit '/peeps'
    click_link('Sign in')
    
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content 'Sign in here to Chitter'
  end
end