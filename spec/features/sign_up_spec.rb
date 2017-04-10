feature 'User registration' do
  scenario 'able to sign up as a new user' do
    visit '/users/new'
    expect(page.status_code).to eq(200)
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, echai93@gmail.com'
    expect(User.first.email).to eq('echai93@gmail.com')
  end

  scenario 'user enters mismatching password' do
    visit '/users/new'
    fill_in(:email, with: 'echai93@gmail.com')
    fill_in(:password, with: 'brocolli')
    fill_in(:password_confirmation, with: 'peach')
    click_button 'Sign up'
    expect(current_path).to eq '/users'
    expect(User.count).to eq 0
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'user does not enter an email' do
    visit '/users/new'
    fill_in(:password, with: 'brocolli')
    fill_in(:password_confirmation, with:'brocolli')
    click_button 'Sign up'
    expect(current_path).to eq '/users'
    expect(User.count).to eq 0
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'user enters an invalid email' do
    visit '/users/new'
    fill_in(:email, with: 'echai93gmail')
    fill_in(:password, with: 'brocolli')
    fill_in(:password_confirmation, with:'brocolli')
    click_button 'Sign up'
    expect(current_path).to eq '/users'
    expect(User.count).to eq 0
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'users enters existing email' do
    User.create(email: 'echai93gmail.com')
    visit '/users/new'
    fill_in(:email, with: 'echai93@gmail.com')
    fill_in(:password, with: 'brocolli')
    fill_in(:password_confirmation, with: 'brocolli')
    click_button 'Sign up'
    expect(current_path).to eq '/users'
    expect(User.count).to eq 1
    expect(page).to have_content 'Email is already been taken'
  end
end
