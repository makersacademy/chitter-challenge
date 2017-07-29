feature 'able to add peep' do
  scenario 'when logged in' do
    visit('/')
    fill_in 'message', with: 'this is my first peep'
    click_button('Submit')
    expect(page).to have_content('this is my first peep')
  end
end
