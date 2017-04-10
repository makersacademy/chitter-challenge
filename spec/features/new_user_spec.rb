feature 'Creating new user' do
  scenario 'Creating new user increases number of users' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(current_path).to eq '/feed'
    expect(page).to have_content "Welcome Freddy"
  end

  scenario 'Cannot sign up twice' do
    sign_up
    expect{sign_up}.to change(User, :count).by(0)
    expect(page).to have_content("Email is already taken")
  end

  scenario 'sign up with two different passwords' do
    visit 'users/new'
    fill_in :email, with: 'john@bong.com'
    fill_in :password, with: 'password'
    fill_in :password_confirmation, with: 'wordpass'
    click_button 'Register'
    expect(User.count).to eq 0
  end

  scenario 'sign up with invalid email address' do
    visit 'users/new'
    fill_in :email, with: 'john'
    fill_in :password, with: 'password'
    fill_in :password_confirmation, with: 'password'
    click_button 'Register'
    expect(User.count).to eq 0
  end

  scenario 'User tries to sign up twice' do
    sign_up
    expect{sign_up}.to change(User, :count).by(0)
    expect(page).to have_content("Email is already taken")
  end

  scenario 'User signs up with blank email' do
    visit 'users/new'
    fill_in :email, with: ''
    fill_in :password, with: 'password'
    fill_in :password_confirmation, with: 'password'
    click_button 'Register'
    expect(User.count).to eq 0
  end

end
