feature 'Sign up for Chitter' do
  scenario 'To post user must sign up' do
    visit '/users/new'
    fill_in 'email', with: 'bob@gmail.com'
    fill_in 'password', with: 's3cr3t'
    fill_in 'password_confirmation', with: 's3cr3t'
    fill_in 'name', with: 'Bob'
    fill_in 'user_name', with: 'bobo'
    click_button 'Sign up'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome, Bob'
    expect(User.count).to eq 1
  end

  scenario 'user enters incorrect password confirmation' do
    visit '/users/new'
    fill_in 'email', with: 'bob@gmail.com'
    fill_in 'password', with: 's3cr3t'
    fill_in 'password_confirmation', with: 'secret'
    click_button 'Sign up'
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
    expect(User.count).to eq 0
  end

  scenario 'do not enter email' do
    visit '/users/new'
    fill_in 'password', with: 's3cr3t'
    fill_in 'password_confirmation', with: 's3cr3t'
    expect(current_path).to eq '/users/new'
    click_button 'Sign up'
    expect(page).to have_content('Email must not be blank')
    expect(User.count).to eq 0
  end

  scenario 'enter invalid email' do
    visit '/users/new'
    fill_in 'email', with: 'hi'
    fill_in 'password', with: 's3cr3t'
    fill_in 'password_confirmation', with: 's3cr3t'
    expect(current_path).to eq '/users/new'
    click_button 'Sign up'
    expect(page).to have_content('Email has an invalid format')
    expect(User.count).to eq 0
  end
end
