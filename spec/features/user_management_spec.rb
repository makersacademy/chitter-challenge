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
    user = create(:user)
    expect { sign_up user }.to change(User, :count).by(1)
    expect(User.first.email).to eq(user.email)
  end

  context 'after successful sign-up' do
    before :each do
      sign_up(create :user)
    end

    scenario 'users are taken to root path' do
      expect(current_path).to eq '/'
    end

    scenario 'and are logged-in and welcomed' do
      expect(page).to have_content "Welcome, bob@example.com."
    end
  end

  context 'after unsuccessful sign-up' do
    before :each do
      sign_up(create :user, email: "")
    end

    scenario 'users are not taken to root path after unsuccessful sign-up' do
      expect(current_path).to_not eq '/'
    end
  end
end