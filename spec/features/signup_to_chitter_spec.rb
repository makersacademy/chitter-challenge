feature 'Signing up to Chitter' do
  scenario 'Creating a Chitter account' do
    visit('/sign_up')
    fill_in :first_name, with: 'Rorie'
    fill_in :last_name, with: 'Clarke'
    fill_in :email_address, with: 'rorieclarke@gmail.com'
    fill_in :user_name, with: 'rhc07'
    fill_in :password, with: 'ilovecoding992'
    click_button 'Submit'
    expect(page).to have_content "Thank you for signing up!"
  end
end

# have a button from the home page that says "Create an account"
