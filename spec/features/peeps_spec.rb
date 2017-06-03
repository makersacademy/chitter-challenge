feature 'peeps creation' do

  scenario 'Users are able to create new messages / peeps' do
    visit '/peeps/new'
    fill_in 'text', with: 'just setting up my chttr'
    click_button 'Peep'
    expect(page).to have_content 'just setting up my chttr'
  end
  
end
