feature 'authentication' do
  scenario 'user can sign in' do
    User.create(name: "Mickey Smith", username: "lonelyboy", email: "mick@brokenheart.com", password: "comebackrose")
    visit('/chitter/sessions/new')
    fill_in :email, with: "mick@brokenheart.com"
    fill_in :password, with: "comebackrose"
    click_button "Sign in"
    expect(page).to have_content "Mickey Smith"
  end
end