feature 'post a peep' do
  scenario 'user can post a message on chitter' do
    visit '/chitter'
    fill_in :peep, with: 'This is a tester peep'
    click_button 'Post Peep'
    
    expect(page).to have_content 'This is a tester peep'
  end
end
