feature 'Posting peeps' do
  scenario 'user posts a peep' do
    visit '/'
    fill_in 'peep_content', with: 'This is a test peep!'
    click_button 'Post'
    expect(page).to have_content 'This is a test peep!'
  end
end
