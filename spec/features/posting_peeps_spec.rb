feature 'posting peeps' do 
  scenario 'user can post messages and see them' do
    visit '/'
    fill_in "new_peep", with: "Twit twoo"
    click_button 'Peep'
    expect(page).to have_content("Twit twoo")
  end
end