feature 'user can sign up' do
  scenario 'I can sign up as a new user' do
    sign_up
    expect(page).to have_content('Hello goober!')
    expect(User.first.email).to eq('john@gmail.com')
  end
end

feature 'user can sign up' do
  scenario 'I can\'t peep if I haven\'t signed up' do
    visit('/chitter-home')
    click_button('peep!')
    expect(page).to have_content('Sign up for Chitter')
  end
end

feature 'user can sign up' do
  scenario 'I can peep if I have signed up' do
    sign_up
    click_button('peep!')
    expect(page).to have_content('Peep your friends')
  end
end
