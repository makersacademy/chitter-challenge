feature 'post a peep' do
  scenario 'post a message to chitter' do
    visit '/' 
    fill_in :peep, with: 'My first peep'
    click_on "Post"
    visit '/peeps'
    expect(page).to have_content "My first peep"
  end
end
