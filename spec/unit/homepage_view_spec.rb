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
  scenario 'Upon pressing the button the user is redirected' do
    visit('/post')
    fill_in :peep, with: "Redirection test!"
    click_button :Peep!
    expect(current_path).to eq('/')
  end
end
