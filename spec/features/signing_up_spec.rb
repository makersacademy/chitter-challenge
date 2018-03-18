feature 'Signing up' do
  scenario 'User can sign up with their credentials' do
    visit '/peeps'
    click_button 'Sign up!'
    fill_in('Email', with: 'jamesbrown@funk.com')
    fill_in('Password', with: 'mother_popcorn_123')
    fill_in('Name', with: 'James Brown')
    fill_in('Username', with: 'godfatherOfFunk')
    click_button('Sign up')
    expect(page).to have_content 'You have signed up to Chitter, James Brown'
    expect(page).to have_selector(:button, "Back to the homepage")
  end
end
