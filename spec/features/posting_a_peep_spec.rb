feature 'Posting a peep' do
  scenario 'Allows user to post a peep and see their peep on the page' do
    visit('/')
    fill_in('peep', with: 'Hello world!')
    click_button('Submit')
    expect(page).to have_content 'Hello world!'
  end
end
