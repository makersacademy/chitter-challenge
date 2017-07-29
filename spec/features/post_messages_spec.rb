feature 'FEATURE: Posting messages' do
  scenario 'posting a message' do
    visit '/peeps/new'
    fill_in 'message', with: "trolltrolltroll"
    click_button 'Peep!'
    expect(page).to have_content "trolltrolltroll"
  end
end
