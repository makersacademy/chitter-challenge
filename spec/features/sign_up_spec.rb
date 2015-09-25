feature 'Sign up' do

  scenario 'I can sign up as a new user' do
    user = build(:user)
    expect { sign_up(user) }.to change(User, :count).by(1)
    # expect(page).to have_content
    expect(User.first.email).to eq user.email
    expect(User.first.name).to eq user.name
    expect(User.first.nickname).to eq user.nickname
  end

  def sign_up(user)
    visit '/users/new'
    fill_in 'email', with: user.email
    fill_in 'name', with: user.name
    fill_in 'nickname', with: user.nickname
    fill_in 'password', with: user.password
    fill_in 'password_confirmation', with: user.password_confirmation
    click_button 'Sign up'
  end
end
