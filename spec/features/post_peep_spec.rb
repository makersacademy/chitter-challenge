feature 'Posting peep' do
  scenario 'User can add peep which appears on list' do
    visit('/peeps/new')
    fill_in 'peep', with: 'This is Peep 1'
    click_button 'Post'
    expect(page).to have_content 'This is Peep 1'
  end
end
