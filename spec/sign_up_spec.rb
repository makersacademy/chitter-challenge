feature 'sign up' do

  let(:user) { user = build(:user) }

  scenario 'A new user can sign up' do
    expect {sign_up(user)}.to change(User, :count).by 1
    expect(page).to have_content('Welcome user93')
    expect(User.first.email).to eq('user@example.com')
  end

  scenario 'requires a matching confirmation password' do
    user = create(:user, password_confirmation: 'wrong_password')
    expect { sign_up(user) }.not_to change User, :count
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'user can\'t sign up without email' do
    user = create(:user, email: nil)
    expect{sign_up(user)}.not_to change User, :count
    expect(current_path).to eq '/users'
    expect(page).to have_content "Email must not be blank"
  end

  scenario 'can\'t sign in with invalid email' do
    user = create(:user, email: 'example.com')
    expect{sign_up(user)}.not_to change User, :count
    expect(current_path).to eq '/users'
    expect(page).to have_content "Email has an invalid format"
  end

  scenario 'can\'t sign up with an already registered email' do
    user = create(:user)
    sign_up(user)
    expect{sign_up(user)}.not_to change User, :count
    expect(page).to have_content "Email is already taken"
  end

  scenario 'user can\'t sign up without username' do
    user = create(:user, username: nil)
    expect{sign_up(user)}.not_to change User, :count
    expect(current_path).to eq '/users'
    expect(page).to have_content "Username must not be blank"
  end

  scenario 'user can\'t sign up without name' do
    user = create(:user, name: nil)
    expect{sign_up(user)}.not_to change User, :count
    expect(current_path).to eq '/users'
    expect(page).to have_content "Name must not be blank"
  end
end
