require 'pg'
feature 'create instant messages' do
  scenario 'user can create instant messages and post it' do
    visit'/'
    fill_in('peep', with: 'peep test')
    click_button('peep')
    expect(page).to have_content 'peep test'
  end
end
