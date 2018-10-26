feature "signing out" do
  before do
    visit '/'
    sign_up
  end

  scenario 'can see Sign Out button' do
    expect(page).to have_selector(:button, "Sign Out")
  end

  context 'user clicks Sign Out button' do
    before { click_button "Sign Out" }

    scenario "user sees Sign Up and Sign In buttons" do
      expect(page).to have_selector(:button, "Sign Up")
      expect(page).to have_selector(:button, "Sign In")
    end

    scenario "user does not see Sign Out button" do
      expect(page).not_to have_selector(:button, "Sign Out")
    end
  end
end
