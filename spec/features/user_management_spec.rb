

feature 'User can sign up' do

  scenario 'I can sign up as a new user' do
    visit '/user/new'
    fill_in 'name', with: 'Elin'
    fill_in 'email', with: 'elinnet@gmail.com'
    click_button 'Sign up'

    expect(page).to have_content('Welcome, Elin')
  end
end