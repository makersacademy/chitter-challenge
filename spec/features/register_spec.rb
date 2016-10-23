feature 'registering' do

  it 'directs to an initial landing page where users can choose to sign in of register for the first time' do
    visit ("/")
    expect(page).to have_button "Register"
    expect(page).to have_button "Sign in"
  end

  it 'contains the peeps already posted' do
    register
    sign_in
    create_peep("Something interesting")
    click_button "Sign out"
    visit ("/")
    expect(page).to have_content "Something interesting"
  end

  it "allows users to enter their details and displays a welcome message once they have done so" do
    incomplete_register
    fill_in "password_confirmation", with: "password123"
    expect{ click_button 'Register' }.to change{ User.all.count }.by(1)
    expect(current_path).to eq '/peeps/peepdeck'
    expect(page).to have_content 'Welcome, Alan'
  end

  scenario "non-identical passwords" do
    incomplete_register
    fill_in "password_confirmation", with: "password456"
    expect{ click_button 'Register' }.to change{ User.all.count }.by(0)
    expect(current_path).to eq '/users/new_user_authenticate'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  it "will not allow registration with an email that has already been registered" do
    visit ("/")
    register
    register
    expect(current_path).to eq '/users/new_user_authenticate'
    expect(page).to have_content 'Email is already taken'
  end
end
