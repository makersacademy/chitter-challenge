require_relative './web_helpers'

feature 'Add New Post' do
  scenario 'user can sign up and enter a new post' do
    visit('/chitter')
    sign_up
    add_new_post
    expect(page).to have_content("First post by Amy")
  end

  scenario 'user can log in and enter a new post' do
    visit('/chitter')
    sign_up
    log_out
    log_in
    add_new_post
    expect(page).to have_content("First post by Amy")
  end

  scenario 'user can\'t post without logging in' do
    visit('/chitter')
    click_link('Add New Post')
    expect(page).to have_content("Please log in to post new peeps.")
  end
end
