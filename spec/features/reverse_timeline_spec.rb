feature 'Reverse Timeline' do
  scenario 'User can view their peeps in reverse chronological order' do
    visit '/posts/new'
    fill_in 'message', with: 'A first peep!'
    click_button 'Add Peep'
    visit '/posts/new'
    fill_in 'message', with: 'A second peep!'
    click_button 'Add Peep'
    expect(page).to have_content 'A second peep! A first peep!'
  end
end
