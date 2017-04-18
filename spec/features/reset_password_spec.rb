feature 'Resetting Password' do
  scenario 'When I forget my password I can see a link to reset' do
    visit '/sessions/new'
    click_link 'I forgot my password'
    expect(page).to have_content("Please enter your email address")
  end

  scenario 'When I enter my email I am told to check my inbox' do
    visit '/users/recover'
    fill_in :email, with: "jean@example.com"
  end
end
