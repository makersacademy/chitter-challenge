require_relative '../factories/user.rb'


feature 'User sign up' do

  scenario 'users can sign up for chitter' do
    user = build :user
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, test@example.com')
    expect(User.first.email).to eq('test@example.com')
  end

end

feature 'User signs in' do

  scenario 'users can sign into chitter' do
    user = create :user
    sign_in(user)
    expect(page).to have_content "Welcome, #{user.email}"
  end

end

feature 'User signs out' do

  scenario 'whilst signed in, user can sign out' do
    user = create :user
    sign_in(user)
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, test@example.com')
  end
end
