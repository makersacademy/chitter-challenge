feature 'Viewing bookmarks' do
  scenario 'A user can see peeps' do
    visit('/peeps')

    expect(page).to have_content "Hello, working on my Chitter weekend-challenge"
  end
end