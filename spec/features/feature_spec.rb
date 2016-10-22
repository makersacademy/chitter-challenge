require_relative'web_helper.rb'

feature 'multiple users can sign up' do
  scenario 'user count increases by 1 and welcome message is shown' do
    sign_up
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, lilian.gmail.com"
  end
end

feature 'User sign in' do
  let!(:user) do
    User.create(name: 'Lilian Breidenbach',
                username: 'Lilian2112',
                email: 'lilian.gmail.com',
                password: 'lemonaid',
                password_confirmation: 'lemonaid')
  end
  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, lilian.gmail.com"
  end
end

feature 'User signs out' do
  let!(:user) do
    User.create(name: 'Lilian Breidenbach',
                username: 'Lilian2112',
                email: 'lilian.gmail.com',
                password: 'lemonaid',
                password_confirmation: 'lemonaid')
  scenario 'while being signed in' do
    sign_in(email: 'test@test.com', password: 'test')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end
