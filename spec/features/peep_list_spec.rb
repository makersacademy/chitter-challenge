feature 'see peep list in reverse chronological order' do
  scenario 'logged in' do
    visit('/')
    fill_in 'message', with: 'this is my first peep'
    click_button('Submit')
    fill_in 'message', with: 'this is my second peep'
    click_button('Submit')
    expect(page).to have_content('this is my second peep this is my first peep')
  end
end
