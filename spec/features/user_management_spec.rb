feature 'User Management' do
  include Rack::Test::Methods

  def sign_up(user)
    visit '/users/new'
    fill_in :email, with: user.email
    fill_in :password, with: 'testpassword'
    click_on 'Submit'
  end

  scenario 'Sign-up page has labels for fields' do
    visit '/users/new'
    expect(page).to have_content 'Enter your email address:'
    expect(page).to have_content 'Enter your password'
  end

  scenario 'Users can sign up' do
    user = create(:user)
    expect { sign_up user }.to change(User, :count).by(1)
    expect(User.first.email).to eq(user.email)
  end

  scenario 'Users are taken to root path after successful sign-up' do
    sign_up(create :user)
    expect(current_path).to eq '/'
  end

  scenario 'Users are not taken to root path after unsuccessful sign-up' do
    sign_up(create :user, email: "")
    expect(current_path).to_not eq '/'
  end

  scenario 'Users are logged-in and welcomed after signing-up' do
    user = create(:user)
    sign_up user
    expect(page).to have_content "Welcome, #{user.email}."
  end
end