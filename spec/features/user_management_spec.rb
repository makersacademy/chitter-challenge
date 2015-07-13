feature 'User sign up' do

  scenario 'can sign up as new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, examplealice')
    expect(User.first.email).to eq('alice@example.com')
  end

  def sign_up(username: 'examplealice', email: 'alice@example.com', password: 'oranges!', password_confirmation: 'oranges!')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up_p(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  def sign_up_p(email: 'alice@example.com', password: '123', password_confirmation: '123')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  scenario 'password doesnt match' do
    expect { sign_up_p(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password and confirmation password do not match')
  end
end