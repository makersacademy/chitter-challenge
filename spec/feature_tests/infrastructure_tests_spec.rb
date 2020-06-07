# frozen_string_literal: true

feature 'index page' do
  scenario 'shows content of posts' do
    add_test_data
    visit('/posts')
    expect(page).to have_content('CNN is FAKE NEWS')
  end
end

feature 'index page' do
  scenario 'new post added' do
    visit('/')
    fill_in 'username', with: 'Big Dom Cummings'
    fill_in 'password', with: 'BarnardCastle260' 
    click_button('submit')
    
    fill_in 'content', with: 'We MUST BUILD THE WALL NOW!'
    click_button('post')
    expect(page).to have_content('We MUST BUILD THE WALL NOW!')
  end
end


