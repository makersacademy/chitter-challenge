feature 'user registration' do
  scenario 'user can sign up' do
    visit('/users')
    fill_in :name, with: "Leo D"
    fill_in :username, with: "Leothelion"
    fill_in :email, with: "newuser@umail.com"
    fill_in :password, with: "lovemai"
    click_button "Sign Up"

    expect(page).to have_content "Leo D"
  end
end 