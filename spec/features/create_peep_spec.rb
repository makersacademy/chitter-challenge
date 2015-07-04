feature 'Posting a peep' do
  scenario 'I can post a peep' do
    sign_up
    sign_in
    visit '/peeps'
    click_button('New peep')
    expect(page).to have_content 'Enter your peep here'
  end

end
