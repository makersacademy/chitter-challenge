feature 'posting peeps' do 
  scenario 'user can post messages and see them' do
    visit '/'
    fill_in "peep", with: "test peep"
    expect(page).to have_content("test peep")
  end
end