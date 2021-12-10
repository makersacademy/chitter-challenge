feature 'user should be able to sign up' do
  scenario 'signs up' do
    visit('/')
    click_button('Sign up')
    fill_in('name', with: 'Kim')
    fill_in('username', with: 'kim-morgan')
    fill_in('email', with: 'fake_kim_email@gmail.com')
    fill_in('password', with: 'password123')
    click_button('Sign up')
    expect(page).to have_content('Welcome to Chitter, Kim!')
  end

  scenario 'cannot sign up as existing user' do
    visit('/')
    click_button('Sign up')
    fill_in('name', with: 'Kim')
    fill_in('username', with: 'kim-morgan')
    fill_in('email', with: 'fake_kim_email@gmail.com')
    fill_in('password', with: 'password123')
    click_button('Sign up')
    visit('/users/new')
    fill_in('name', with: 'Kim')
    fill_in('username', with: 'kim-morgan')
    fill_in('email', with: 'fake_kim_email@gmail.com')
    fill_in('password', with: 'password123')
    click_button('Sign up')
    expect(page).to have_content('User already exists!')
  end
end
