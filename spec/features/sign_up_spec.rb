require 'pg'

feature 'sign up to Chitter' do
  before(:each) do
    empty
    add_base_posts
  end
  scenario 'A user can sign up and post as themselves to Chitter' do
    visit('/')
    fill_in('email', with: "123@gmail.com")
    fill_in('password', with: "password1")
    fill_in('name', with: "Clarence")
    fill_in('username', with: "clarencewozere")
    click_button('Submit')
    expect(page).to have_content("123@gmail.com")
    expect(page).to have_content('password1')
    expect(page).to have_content('Clarence')
    expect(page).to have_content('clarencewozere')
  end
end
