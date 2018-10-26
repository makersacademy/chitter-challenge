# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign up for Chitter' do
  scenario 'A user can get to the registration page' do
    visit('/')
    click_link('Register for Chitter')
     # p URI.parse(current_url)
     # p current_path
    expect(current_path).to eq "/user/register"
  end

  scenario 'A user can enter their sign up details' do
    visit('/')
    click_link('Register for Chitter')
    # p current_path
    fill_in :firstname, with: 'Joe'
    fill_in :lastname, with: 'Bloggs'
    fill_in :username, with: 'peeper1234'
    fill_in :password, with: 'supersecretpassword'
    fill_in :email, with: 'test@test.com'
    click_button('Register')

     # p URI.parse(current_url)
     # p current_path
    expect(page).to have_content "You have signed up, Joe Bloggs"
    expect(page).to have_content "Your username is: peeper1234"
    expect(page).to have_content "The email address you have registered with is test@test.com"
  end
end
