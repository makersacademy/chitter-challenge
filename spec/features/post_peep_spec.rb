feature 'Posting Peeps' do
  scenario 'posting a peep will display it on the homepage' do
    visit('/')
    click_button('New Peep')
    body = 'Bae caught me peepin'
    fill_in 'body', with: body
    click_button('Submit Peep!')
    expect(page).to have_content(body)
  end
end
