feature 'User sign up' do

  let(:user) {build :user}

  scenario 'I can sign up as a new user' do
    user = build :user
    expect { sign_up_as(user) }.to change(User, :count).by(1)
    expect(page).to have_content('Hello, bobiscool')
    expect(User.first.username).to eq('bobiscool')
  end

  scenario 'stays on the same page if passwords do not match' do
    user = build(:user, password_confirmation: 'wrong')
    expect { sign_up_as(user) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Passwords don\'t match'
  end

  scenario 'you won\'t be signed up without entering a username' do
    user = build(:user, username: '')
    expect { sign_up_as(user) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Username must not be blank'
  end

  scenario 'the same username can\'t be registered twice' do
    user = build :user
    sign_up_as(user)
    expect { sign_up_as(user) }.to change(User, :count).by(0)
    expect(page).to have_content('Username already taken')
  end

  def sign_up_as(user)
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :username,              with: user.username
    fill_in :password,              with: user.password
    fill_in :password_confirmation, with: user.password_confirmation
    click_button 'Sign up'
  end

end
