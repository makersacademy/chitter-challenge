feature "signing up for chitter" do
  scenario "going to a sign up page and signing up" do
    sign_up "Alastair", "fake@email.com"

    expect(page).to have_content "Welcome Alastair"
    expect(page).not_to have_link "Sign Up"
  end

  scenario "attempting to sign up with the same email address fails" do
    sign_up "Alastair", "alastair@fake_email.com"

    visit '/users/new'

    fill_in 'user_name', with: "Not Alastair"
    fill_in 'user_email', with: "alastair@fake_email.com"
    click_button 'Sign up'

    expect(page).to have_content "This email is already registered, sorry."
    expect(User.all.size).to eq 1
  end

  scenario "cannot post before signing up" do
    visit '/'

    expect(page).not_to have_selector 'form'
  end
end
