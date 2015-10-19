feature "User sign up" do

def sign_up_as(user)
  visit 'users/new'

  fill_in :name,                  with: user.name
  fill_in :username,              with: user.username
  fill_in :email,                 with: user.email
  fill_in :password,              with: user.password
  fill_in :password_confirmation, with: user.password_confirmation
  click_button 'Sign up for Chitter'
end

  scenario 'I can sign up as a new user' do
    user = build :user
    expect { sign_up_as(user) }.to change(User, :count).by(1)
    expect(page).to have_content("Hello, #{user.username}")
    # expect(User.first.username).to eq("#{user.username}")
  end

  scenario 'requires a matching confirmation password' do
    user = build(:user, password_confirmation: 'wrong')
    expect { sign_up_as(user) }.not_to change(User, :count)
  end

  scenario 'returns an error when a password does not match' do
    user = build(:user, password_confirmation: 'wrong')
    expect { sign_up_as(user) }.not_to change(User, :count)
    expect(current_path).to eq ('/users')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'requires an email' do
    user = build(:user, email: '')
    expect { sign_up_as(user) }.not_to change(User, :count)
  end

  scenario 'requires a valid email address' do
    user = build(:user, email: 'test')
    expect { sign_up_as(user) }.not_to change(User, :count)
  end

  scenario 'I cannot sign up with an existing email' do
    user = build :user
    sign_up_as(user)
    expect{ sign_up_as(user) }.to change(User, :count).by(0)
    expect(page).to have_content('We already have that email.')
  end

end

feature "User sign in" do

  def sign_in_as(user)
    visit '/sessions/new'
    fill_in :email,    with: user.email
    fill_in :password, with: user.password
    click_button 'Sign in'
  end

  scenario 'I can sign in as a user' do
    user = create :user
    sign_in_as(user)
    expect(page).to have_content "Hello, #{user.username}"
  end

end
