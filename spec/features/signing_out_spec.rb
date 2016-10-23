require_relative 'web_helpers'

feature 'signing out' do
  let!(:user) do
    User.create(first_name: "Alan",
                last_name: "Shearer",
                username: "alan123",
                email: "alan@nufc.com",
                password: "password123",
                password_confirmation: "password123")
  end
  it 'allows a user to sign out' do
    sign_in
    click_button "Sign out"
    expect(page).to have_content "Peep again soon"
    expect(page).not_to have_content "Welcome, Alan"
    expect(current_user).to eq "/"
  end

end
