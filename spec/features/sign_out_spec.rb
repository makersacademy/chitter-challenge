describe 'Sign out' do

  let!(:user) do
    User.create(name: "Mike",
                username: "Mickey-boy",
                email: 'mike@mike.com',
                password: '1234')
  end

  scenario "there is a sign out button" do
    sign_in(email: user.email,
            password: '1234')
    expect(page).to have_content "Sign out"
  end

  scenario "there is a goodbye message when signed out" do
    sign_in(email: user.email,
            password: '1234')
    click_button "Sign out"
    expect(page).to have_content "Goodbye!"
    expect(page).not_to have_content("Welcome #{user.username}")
  end
end
