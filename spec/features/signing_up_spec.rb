feature "signing up" do
  scenario "loading the sign-up page" do
    visit('/')
    click_button("Sign up")

    expect(current_path).to eq '/sign-up'
    expect(page).to have_field "username"
    expect(page).to have_field "email"
    expect(page).to have_field "first_name"
    expect(page).to have_field "last_name"
  end

  scenario "filling in the fields and submitting re-routes to home page with Welcome username" do
    visit('/')
    click_button("Sign up")
    fill_in 'username', with: 'ChrisL'
    fill_in 'last_name', with: 'Lovell'
    fill_in 'first_name', with: 'Chris'
    fill_in 'email', with: 'chris@chris.com'
    fill_in 'password', with: '12345'
    click_button "Sign up"

    expect(current_path).to eq '/'
    expect(page).to have_content "Welcome, ChrisL"
  end

  scenario "not filling a field, raises message 'Please ensure you have filled all the fields'" do
    visit('/')
    click_button("Sign up")
    fill_in 'username', with: 'ChrisL'
    fill_in 'last_name', with: 'Lovell'
    fill_in 'first_name', with: 'Chris'
    fill_in 'email', with: 'chris@chris.com'
    click_button "Sign up"

    expect(current_path).to eq '/sign-up'
    expect(page).to_not have_content "Welcome, ChrisL"
    expect(page).to have_css('h2', text: "Please ensure you have filled all the fields")
  end

end
