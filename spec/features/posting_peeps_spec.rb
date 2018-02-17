feature 'posting peeps' do 
  scenario 'user can post messages and see them' do
    visit '/'
    # fill_in "new_peep", with: "test peep"
    # click_button 'peep'
    expect(page).to have_content("test peep")
  end
end