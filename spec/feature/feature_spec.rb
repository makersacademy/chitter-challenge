#Feature tests for the web app

feature 'Add bookmarks' do
  scenario 'index shows all peeps' do
    visit('/')
    expect(page).to have_content "Post from 2019-12-02 @ 10:00"
    expect(page).to have_content "Post from 2019-11-17 @ 10:00"
    expect(page).to have_content "Post from 2019-08-16 @ 10:00"
    expect(page).to have_content "Post from 2019-12-02 @ 08:00"
  end
end
