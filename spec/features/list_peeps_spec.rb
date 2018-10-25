feature 'listing peeps' do
  scenario 'user can see all peeps' do
    visit '/chitter'
    expect(page).to have_content 'My first peep'
  end
end 
