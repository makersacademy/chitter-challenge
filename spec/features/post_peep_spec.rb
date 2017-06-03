feature 'Post Peep' do
  scenario 'User can post a message (a peep) to the website' do
    visit '/posts/new'
    fill_in 'message', with: 'A first peep!'
    click_button 'Add Peep'
    expect(page).to have_content 'A first peep!'
  end
end
