feature 'Posting peep' do
  scenario 'User can add peep to chitter' do
    visit('/')
    click_button 'Add peep'
    fill_in 'peep', with: 'This is Peep 1'
    click_button 'Post'
    expect(page).to have_content 'This is Peep 1'
  end
end
