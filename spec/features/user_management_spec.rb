feature 'User sign up' do

  let(:user){ build :user }

  def sign_up(user)
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: user.email
    fill_in :handle, with: user.handle
    fill_in :password, with: user.password
    fill_in :password_confirmation, with: user.password_confirmation
    click_button 'Sign up'
  end

  scenario 'I can sign up as a new user' do
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, chweeks')
    expect(User.first.email).to eq('chris@example.com')
  end

  scenario 'requires a matching confirmation password' do
    user = build(:user, password_confirmation: 'wrong')
    expect {sign_up(user)}.not_to change(User,:count)
  end

  scenario 'with a password that does not match' do
    user = build(:user, password_confirmation: 'wrong')
    expect {sign_up(user)}.not_to change(User,:count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
  end

end
