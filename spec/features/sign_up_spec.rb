feature 'sign up' do
  scenario 'user can sign up to chitter' do
    visit ('/')
    click_link "Sign up"

    expect(page).to have_field("username")
    expect(page).to have_field("email")
    expect(page).to have_button("Sign up")

  end
end
