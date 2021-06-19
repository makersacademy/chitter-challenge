feature 'registration' do
  scenario 'a user can sign up' do
    visit('/users')
    fill_in('email', with: 'superhans@chitter.com')
    fill_in('password', with: 'guessme')
    click_button('Submit')

    expect(page).to have_content "Welcome, superhans@chitter.com"
  end
end