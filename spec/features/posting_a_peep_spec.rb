feature 'Posting peeps' do
  scenario 'user posts a peep' do
    visit '/'
    fill_in 'peep_content', with: 'Mittens!'
    click_button 'Post'
    expect(page).not_to have_content 'NoMethodError'
    expect(page).to have_content 'Mittens!'
  end
end
