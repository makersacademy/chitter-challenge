feature "signing up for chitter" do
  scenario "going to a sign up page and signing up" do
    sign_up "Alastair", "fake@email.com"

    expect(page).to have_content "Welcome Alastair"
    expect(page).not_to have_link "Sign Up"
  end

  scenario "attempting to sign up with the same email address fails" do
    sign_up "Alastair", "alastair@fake_email.com"
    click_on 'Log out'
    sign_up "Not Alastair", "alastair@fake_email.com"

    expect(page).to have_content "This username or email is already registered, sorry."
    expect(User.all.size).to eq 1
  end

  scenario "attempting to sign up with the same username fails" do
    sign_up "Alastair", "alastair@fake_email.com", "username1"
    click_on 'Log out'
    sign_up "Not Alastair", "not_alastair@fake_email.com", "username1"

    expect(page).to have_content "This username or email is already registered, sorry."
    expect(User.all.size).to eq 1
  end

  scenario "cannot post before signing up" do
    visit '/'

    expect(page).not_to have_selector 'form'
  end
end
