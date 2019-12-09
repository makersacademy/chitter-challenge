feature 'add a new post' do
  scenario 'add a new post' do
    visit '/peeps'
    click_on 'New Post'
    expect(page).to have_content "Add a new post"
  end
end