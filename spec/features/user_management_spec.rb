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

  scenario 'users can sign up' do
    user = build(:user)
    expect { sign_up user }.to change(User, :count).by(1)
    expect(User.first.email).to eq(user.email)
  end

  scenario 'user cannot sign up with an email that already exists' do
    create(:user)
    user = build(:user)
    sign_up(user)
    expect(current_path).to eq '/users/new'
  end

  context 'when trying to sign up with an email that already exists' do
    scenario "user is alerted with a flash message that the email already exists"
  end

  context 'after successful sign-up' do
    before(:each){ sign_up(create :user) }

    scenario 'users are taken to root path' do
      expect(current_path).to eq '/'
    end

    scenario 'and are logged-in and welcomed' do
      expect(page).to have_content "Welcome, bob@example.com."
    end
  end

  context 'after unsuccessful sign-up' do
    before(:each){ sign_up(create :user, email: "") }

    scenario 'users are not taken to the root path' do
      expect(current_path).to_not eq '/'
    end
  end
end