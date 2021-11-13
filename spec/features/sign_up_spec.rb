feature 'sign up' do
  scenario 'user can sign up to chitter' do
    visit ('/')
    click_link "Sign up"
    fill_in :username, with: "Joe Bloggs"
    fill_in :email, with: "joe@gmail.com"
    click_button "Sign up"
    expect(page).to have_content "Joe Bloggs"
  end
end
