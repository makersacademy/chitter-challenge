feature 'User sign up' do

  include Helpers

  scenario 'I can sign up as a new user' do
    user = build :user
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, matt@matt.com')
    expect(User.first.email).to eq('matt@matt.com')
  end

  scenario 'I cant sign in without entering an email' do
    visit '/users/new'
    click_button 'Sign up'
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'with a password that does not match' do
    user = build :failed_user
    expect { sign_up(user) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content "Password does not match the confirmation"
  end


  scenario 'I cannot sign up with an existing email' do
    user = build :user
    sign_up(user)
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
  end

  feature 'User sign in' do

   let(:user) { user = build(:user) }

   scenario 'can log in with correct credentials' do

     user = create(:user)
     sign_in(user)
     expect(page).to have_content("Welcome, #{user.email}")
   end


  end
end
