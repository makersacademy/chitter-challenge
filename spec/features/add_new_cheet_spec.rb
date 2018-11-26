feature 'Adding a new cheet' do
  scenario 'A user visiting the cheets main page can add a cheet and see it' do
    visit '/cheets'
    click_button('New Cheet')
    fill_in('content', with: 'A new cheet is born')
    click_button('Cheet it!')
    expect(page).to have_text('A new cheet is born')
  end
end
