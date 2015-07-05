feature 'User\'s' do

  def sign_up(username: 'Triffanys101',
              email: 'triffanys@example.com',
              password: 'princess',
              password_confirmation: 'princess')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :username, with: username
    fill_in :email,    with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  scenario 'can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Triffanys101')
    expect(User.first.username).to eq('Triffanys101')
  end

  scenario 'requires a matching confirmation password when signing up' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'must enter an email address and username when signing up' do
    visit '/users/new'
    fill_in :password, with: 'hello'
    fill_in :password_confirmation, with: 'hello'
    click_button 'Sign up'
    expect(current_path).to eq('/users')
    expect(page).to have_content 'must not be blank'
  end

  scenario 'cannot sign up with an existing email' do
    sign_up(user)
    expect(page.status_code).to eq(200)
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
  end
end