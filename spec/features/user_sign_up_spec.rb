feature 'user sign up' do

  scenario 'can sign up as a new user' do
    user = build(:user)
    expect {sign_up_as(user)}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome email@email.com')
    expect(User.first.email).to eq('email@email.com')
  end

  scenario 'requires a matching confirmation password' do
    clumsy_user = build(:user, password_confirmation: 'oops_wrong')
    expect {sign_up_as(clumsy_user)}.not_to change(User, :count)
  end

  scenario 'I cannot sign up with an existing email' do
    user = build(:user)
    sign_up_as(user)
    expect{ sign_up_as(user)}.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
  end

  def sign_up_as(user)
    visit '/users/new'
    fill_in :name, with: user.name
    fill_in :username, with: user.username
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    fill_in :password_confirmation, with: user.password_confirmation
    click_button 'Sign Up'
  end
end
