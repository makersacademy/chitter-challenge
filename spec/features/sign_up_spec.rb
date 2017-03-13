# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature "Sign up functionality" do
  scenario "User can sign up with his information" do
    visit '/'
    click_button 'Sign up'
    fill_in 'Username', with: ('Azntastic')
    fill_in 'Email', with: ('Ryanchu.ws@gmail.com')
    fill_in 'Password', with: ('ryanchu1234')
    click_button "Submit"
    expect(current_path).to eq '/sign_up_success'
    expect(page).to have_content 'Sign up succesful'
    expect(User.count).to eq 1
  end
end
