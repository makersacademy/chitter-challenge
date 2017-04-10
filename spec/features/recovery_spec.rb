feature 'Resetting Password' do
  scenario "When I forget my password I can click on a password reset link" do
    visit '/sessions/new'
    click_link 'I forgot my password'
    expect(page).to have_content("Please enter your email address")
  end

  scenario 'When I enter my email I am told to check my inbox' do
   visit '/users/recover'
   fill_in :email, with: SessionHelpers::DEFAULT_EMAIL
   click_button "Submit"
   expect(page).to have_content "Thanks, please check your inbox for the link"
 end

end
