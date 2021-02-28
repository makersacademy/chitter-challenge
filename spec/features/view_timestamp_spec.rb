feature 'timestamp' do
  scenario 'user wants to see timestamp of each tweet' do
    visit ('/peeps')
    expect(page).to have_content('2021-02-28 19:59:41')
  end
end