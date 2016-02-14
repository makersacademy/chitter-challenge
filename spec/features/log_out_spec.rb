# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature "Loggin out" do

  scenario 'A logged in user can log out' do
    sign_up
    log_in 
    click_button('Log out')
    expect(page).to have_content('Goodbye')
    expect(page).not_to have_content('Welcome, Wynndow')
  end


end
