feature 'User can create posts' do
  scenario 'can create a post' do
    visit '/peeps'
    click_on 'Add Peep'
    fill_in('message', with: 'Sunny today eh?')
    click_button 'Post'
    expect(page).to have_content 'Sunny today eh?'
  end
end