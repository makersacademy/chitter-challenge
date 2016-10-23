describe 'Sign in' do

  let!(:user) do
    User.create(name: "Mike",
                username: "Mickey-boy",
                email: 'mike@mike.com',
                password: '1234')
  end

  scenario "user can sign in" do
    sign_in(email: user.email,
            password: '1234')
    expect(page).to have_content "Welcome #{user.username}"
  end

end
