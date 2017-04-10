feature "Viewing peeps" do

  let!(:user) do
    User.create(email: 'test@test.com', password: '123', password_confirmation: '123')
  end

  # As a Maker
  # So that I can let people know what I am doing
  # I want to post a message (peep) to chitter
  scenario "I can see existing peeps on the hub page" do
    sign_in(email: user.email, password: user.password)
    visit "/hub/new"
    fill_in :pweep, with: "My cat likes to demand attention at 5 am"
    click_button "Post peep"

    expect(current_path).to eq "/hub"

    within "ul#hub" do
      expect(page).to have_content "My cat likes to demand attention at 5 am"
    end
  end

end