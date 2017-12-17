require './app/app'
require 'orderly'

feature 'posting a peep on chitter' do
  scenario 'I can post a message and it shows up in the feed' do
    sign_up
    fill_in('peep', with: 'Rest in peace Lil Peep')
    click_button('Post')
    expect(page).to have_content('Rest in peace Lil Peep')
  end
end

feature 'displaying peeps' do
  scenario 'peeps are displayed in reverse order' do
    sign_up
    fill_in('peep', with: 'Rest in peace Lil Peep')
    click_button('Post')
    fill_in('peep', with: 'Peep 2')
    click_button('Post')
    expect(page).to have_content('Rest in peace Lil Peep')
    expect(page).to have_content('Peep 2')
    expect('Rest in peace Lil Peep').to_not appear_before('Peep 2')
  end
end
