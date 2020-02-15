feature 'viewing bookmarks' do 
  scenario 'should be able to view peeps in /peeps/index' do 
    visit "/peeps/index"
    expect(page).to have_content "Peep 1"
  end 
end