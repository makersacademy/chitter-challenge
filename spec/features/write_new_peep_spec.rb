feature 'Adding Peep' do
  scenario 'User clicks add peep, then adds peep' do
    visit('/peeps/new')
    fill_in('content', with: 'This is my first ever peep!')
    click_button 'Post'
    expect(current_path).to be '/peeps'
    expect(page).to have_content 'This is my first ever peep!'
  end
end
