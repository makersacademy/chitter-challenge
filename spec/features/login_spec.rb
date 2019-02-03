feature 'As a Maker' do
  scenario 'You can click on a button and sign up' do
    visit '/'
    click_button 'Sign up'
    expect(page).to have_content "Sign up to use Chitter"
  end
  scenario 'You can register then see the newsfeed' do
    visit '/'
    click_button 'Sign up'
    fill_in 'username', with: 'Username'
    fill_in 'password', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content "Newsfeed"
  end
end
