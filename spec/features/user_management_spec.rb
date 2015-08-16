feature 'User can sign up' do
  let(:user) { user = build(:user) }

  scenario 'User can sign up as a new user' do
    sign_up(user)
    expect(current_path).to eq('/')
    expect(page).to have_content("Welcome, #{user.user_name}!")
  end

  scenario 'User cannot sign up unless all details are filled' do
    visit('/users/new')
    user = build(:user, email: '', name: '', user_name: '')
    sign_up(user)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
    expect(page).to have_content('Name must not be blank')
    expect(page).to have_content('User name must not be blank')
    visit('/sessions/new')
    fill_in('email', with: user.email)
    fill_in('password', with: user.password)
    click_button('Log in')
    expect(page).to have_content('The email or password is incorrect')
  end

  scenario 'User cannot sign up with a password that does not match' do
    user = build(:user, password_confirmation: 'wrong')
    sign_up(user)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password does not match the confirmation')
    sign_in(user)
    expect(page).to have_content('The email or password is incorrect')
  end

  scenario 'User cannot sign up with an existing email' do
    sign_up(user)
    click_button('Log out')
    user = build(:user, password: 'changed', password_confirmation: 'changed')
    sign_up(user)
    expect(page).to have_content('Email is already taken')
    sign_in(user)
    expect(page).to have_content('The email or password is incorrect')
  end

  scenario 'User cannot sign up with an existing user name' do
    sign_up(user)
    click_button('Log out')
    user = build(:user, email: 'foo2@bar.com', password: 'changed',
                        password_confirmation: 'changed')
    sign_up(user)
    expect(page).to have_content('User name is already taken')
    sign_in(user)
    expect(page).to have_content('The email or password is incorrect')
  end

  scenario 'User retains inputed information when passwords do not match' do
    user = build(:user, password_confirmation: 'wrong')
    sign_up(user)
    within '#user_info' do
      expect(page).to have_field('email', with: 'foo@bar.com')
      expect(page).to have_field('name', with: 'Foo Bar')
      expect(page).to have_field('user_name', with: 'foobar')
    end
  end
end

feature 'User can log in' do
  let(:user) { user = build(:user) }

  scenario 'User gets logged in after signing up' do
    user = create(:user)
    sign_in(user)
    expect(current_path).to eq('/')
    expect(page).to have_content("Welcome, #{user.user_name}!")
  end

  scenario 'User cannot log in while logged in' do
    user = create(:user)
    sign_in(user)
    visit('/sessions/new')
    expect(current_path).to eq('/')
    expect(page).to have_content("#{user.user_name} is logged in already!")
    expect(page).to have_content("Welcome, #{user.user_name}!")
  end
end

feature 'User can log out' do
  let(:user) { user = build(:user) }

  scenario 'while signed in' do
    user = create(:user)
    visit('/')
    expect(page).not_to have_button('Log out')
    sign_in(user)
    click_button('Log out')
    expect(page).to have_content("Goodbye, #{user.user_name}!")
    expect(page).not_to have_content("Welcome, #{user.user_name}!")
  end
end
