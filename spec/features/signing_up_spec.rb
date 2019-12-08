feature "signing up for chitter" do
  scenario "going to a sign up page and signing up" do
    visit '/'
    click_on 'Sign Up'

    fill_in 'user_name', with: "Alastair"
    fill_in 'user_email', with: "alastair@fake_email.com"
    click_button 'Sign up'

    expect(page).to have_content /Welcome.*Alastair/
    expect(page).not_to have_link "Sign Up"
  end

  scenario "attempting to sign up with the same email address fails" do
    visit '/'
    click_on 'Sign Up'

    fill_in 'user_name', with: "Alastair"
    fill_in 'user_email', with: "alastair@fake_email.com"
    click_button 'Sign up'

    visit '/users/new'

    fill_in 'user_name', with: "Not Alastair"
    fill_in 'user_email', with: "alastair@fake_email.com"
    click_button 'Sign up'

    expect(page).to have_content "This email is already registered, sorry."
    expect(User.all.size).to eq 1
  end
end
