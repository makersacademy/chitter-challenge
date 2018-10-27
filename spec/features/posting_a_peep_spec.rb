feature "Positng a peep" do
  scenario "by clicking 'Post a Peep'" do
    visit '/'
    click_button 'Post a Peep'
    fill_in :peep, with: 'This is a test peep'
    click_button "Peep!"
    expect(page).to have_content "anonymous This is a test peep"
  end
end
