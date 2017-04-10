feature 'Resetting Password' do
  scenario "When I forget my password I can click on a password reset link" do
    visit '/sessions/new'
    click_link 'I forgot my password'
    expect(page).to have_content("Please enter your email address")
  end



end
