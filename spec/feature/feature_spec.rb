#Feature tests for the web app

feature 'Peeps page:' do
  scenario 'index shows all peeps' do
    visit('/')
    expect(page).to have_content "Post from 2019-12-02 @ 10:00"
    expect(page).to have_content "Post from 2019-11-17 @ 10:00"
    expect(page).to have_content "Post from 2019-08-16 @ 10:00"
    expect(page).to have_content "Post from 2019-12-02 @ 08:00"
  end
end

feature 'Peeps page:' do
  scenario 'Create Post button goes to create post page' do
    visit('/')
    click_button "Create Post"
    expect(page).to have_content "Enter a post"
    expect(page).to have_current_path("/create")
  end
end
