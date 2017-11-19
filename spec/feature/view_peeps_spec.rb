feature 'create a peep' do
  scenario 'users creates a peep' do
    visit 'peep/new'
    fill_in :message, with: 'my first peep'
    click_button 'Post'
    expect(page).to have_content 'my first peep'
  end
end
