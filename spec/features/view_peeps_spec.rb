feature 'Viewing Peeps' do
  scenario 'user can see all peeps' do
    visit '/peeps'
    expect(page).to have_content 'This is a test peep'
    expect(page).to have_content 'This is a test peep 2' 
  end
end
