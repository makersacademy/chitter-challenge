feature 'Site mechanics' do
  scenario 'A user can view the main site' do
    visit('/')
    expect(page).to have_no_content("Sinatra doesn't know this ditty")
  end

  scenario 'A user can view the register page' do
    visit('/register')
    expect(page).to have_content("Register for Chitter")
  end

  scenario 'A user can view the main page and see peeps' do
    visit('/')
    expect(page).to have_content("Posted at:")
  end

  scenario 'Peeps appear in reverse chronological order' do
    visit('/')
    expect(page).to have_content("MEOW")
    expect(page.body.index('MEOW') < page.body.index('Hello'))
  end

end

feature 'Posting mechanics' do
  scenario 'A user can view the post page' do
    visit('/post')
    expect(page).to have_no_content("ditty")
  end
  scenario 'User is able to input a peep into a field' do
    visit('/post')
    expect(page).to have_field(:peep)
  end
  scenario 'User gets redirected to main page' do
    visit('/post')
    fill_in :peep, with: "Redirect test!"
    click_button('Peep!')
    expect(page).to have_content "Latest peeps:"
    expect(page).to have_content "Redirect test!"
    expect(page).to have_current_path "/"
  end
end
