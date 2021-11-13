feature 'sign up' do
  scenario 'user can sign up to chitter' do
    visit ('/')
    click_link "Sign up"

    expect(page).to have_field("username")
    expect(page).to have_field("email")
    expect(page).to have_button("Sign up")
=begin
    fill_in :username, with: "Joe Bloggs"
    fill_in :email, with: "joe@gmail.com"
    click_button "Sign up"
    expect(page).to have_content "Joe Bloggs"
=end
  end
end
