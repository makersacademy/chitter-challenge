feature 'peeps are displayed in reverse chronological order' do
  scenario 'user can see latests posts first' do
    sign_in_and_play
    visit('/peeps/new')
    fill_in :peep, with: 'This is the second test'
    click_button 'Submit'
    expect(page).to have_content /This is the second test .+? This is a test peep/
  end
end
