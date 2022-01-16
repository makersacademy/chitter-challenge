
feature 'Post a peep' do
  scenario 'submitting a message' do
    visit '/peeps'
    fill_in 'peep', with: 'This is a peep'
    click_button 'Post'

    expect(page).to have_content 'This is a peep'
  end
end
