feature 'post a peep' do
  scenario 'post and then view a message on chitter' do
    visit '/' 
    fill_in :peep_content, with: 'My first peep'
    click_button 'Post'
    visit '/peeps'
    expect(page).to have_content "My first peep"
  end
end
