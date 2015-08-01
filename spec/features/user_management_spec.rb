feature 'User sign up' do

  let!(:user) { build :user }

  scenario 'I can sign up as a new user' do
    expect { sign_up_as(user) }.to change(User, :count).by (1)
    expect(page).to have_content('Welcome, SardiniaAwesome')
    expect(User.first.username).to eq('SardiniaAwesome')
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up_as(user)
    expect { sign_up_as(user) }.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
  end

end


feature 'User sign in' do

  scenario 'with correct credentials' do
    user = create :user
    sign_in_as(user)
    expect(page).to have_content 'Welcome'
  end

end

feature 'User signs out' do

  before(:each) do
    user = create :user
    sign_in_as(user)
  end

  scenario 'while being signed in' do
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome')
  end

end