feature 'user signs up' do
  scenario 'user can enter signup details' do
    visit '/users/new'
    fill_in 'email', with: 'bob@gmail.com'
    fill_in 'password', with: 's3cr3t'
    fill_in 'password_confirmation', with: 's3cr3t'
    click_button 'Sign Up'
    expect(current_path).to eq '/index'
    expect(page).to have_content 'Welcome, bob@gmail.com'
    expect(User.count).to eq 1
  end

scenario 'user wrong password confirmation' do
    visit '/users/new'
    fill_in 'email', with: 'bob@gmail.com'
    fill_in 'password', with: 's3cr3t'
    fill_in 'password_confirmation', with: 'secret'
    click_button 'Sign Up'
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
    expect(User.count).to eq 0
  end

  scenario 'enter invalid email' do
    visit '/users/new'
    fill_in 'email', with: 'hi'
    fill_in 'password', with: 's3cr3t'
    fill_in 'password_confirmation', with: 's3cr3t'
    expect(current_path).to eq '/users/new'
    click_button 'Sign Up'
    expect(page).to have_content('Email has an invalid format')
    expect(User.count).to eq 0
  end

  scenario 'cannot sign up with an already registered email address' do
    User.create(email: 'bob@gmail.com', password: 's3cr3t', password_confirmation: 's3cr3t')
    visit '/users/new'
    fill_in 'email', with: 'bob@gmail.com'
    fill_in 'password', with: 's3cr3t'
    fill_in 'password_confirmation', with: 's3cr3t'
    click_button 'Sign Up'
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email is already taken'
    expect(User.count).to eq 1
  end
end
