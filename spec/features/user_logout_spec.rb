#As a Maker
#So that I can avoid others posting messages on Chitter as me
#I want to log out of Chitter

feature 'Sign out' do
  
  scenario 'User signs up, then signs out, redirect to home page' do
    signup
    click_button('Log out')
    expect(current_path).to eq('/')
  end

  scenario 'User signs up, then signs out, tries to access peeps but is redirected' do
    signup
    click_button('Log out')
    visit('/peeps')
    expect(current_path).to eq('/user/signin')
  end
  
  scenario 'User signs up, then signs out, tries to access peeps but is redirected with error message' do
    signup
    click_button('Log out')
    visit('/peeps')
    expect(page).to have_content('Please log in first')
  end
end
