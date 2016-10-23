feature 'signing in' do

  it 'directs to an initial landing page where users can choose to sign in of register for the first time' do
    visit ("/")
    expect(page).to have_button "Register"
    expect(page).to have_button "Sign in"
  end

  it "allows users to enter their details and displays a welcome message once they have done so" do
    visit ("/")
    click_button "Register"
    fill_in "first_name", with: "Alan"
    fill_in "last_name", with: "Shearer"
    fill_in "username", with: "alan123"
    fill_in "email", with: "alan@nufc.com"
    fill_in "password", with: "password123"
    fill_in "password_confirmation", with: "password123"
    expect{ click_button 'Register' }.to change{ User.all.count }.by(1)
    expect(current_path).to eq '/peeps/peepdeck'
    expect(page).to have_content 'Welcome, Alan'
  end

  scenario "non-identical passwords" do
    visit ("/")
    click_button "Register"
    fill_in "first_name", with: "Alan"
    fill_in "last_name", with: "Shearer"
    fill_in "username", with: "alan123"
    fill_in "email", with: "alan@nufc.com"
    fill_in "password", with: "password123"
    fill_in "password_confirmation", with: "password456"
    expect{ click_button 'Register' }.to change{ User.all.count }.by(0)
    # expect(current_path).to eq '/users/register'
    expect(page).to have_content 'Password and cofnrimation do not match'
  end

  it "will not allow a register with an email that has already been registered" do
    visit ("/")
    register
    register
    # expect(current_path).to eq '/users/register'
    expect(page).to have_content 'Email is already taken'
  end
end
