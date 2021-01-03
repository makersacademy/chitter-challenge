require 'pg'

feature 'view posts' do
  before(:each) do
    empty
    add_base_posts
  end
  scenario 'A user can see posts in reverse chronological order' do
    visit('/postboard')

    expect(page).to have_content("tis almost Christmas!")
    expect(page).to have_content('Bring on 2021!!!')
    expect(page).to have_content('Goodbye cruel world')
  end
end
