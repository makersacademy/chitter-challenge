feature 'Sign up for Chitter' do
  scenario "Before the home page there is a sign up page" do
     visit '/sign_up'
    expect(page.status_code).to eq 200
  end
end

  # scenario 'Homepage has welcome text' do
  #   visit '/home'
  #   expect(page).to have_content "Welcome to Chitter"
  # end
  # end
