feature 'create a post' do
  scenario 'User can write a post and share on webpage' do
    visit('/peep/new')
    fill_in 'user_name', with: 'Harry'
    fill_in 'user_handle', with: '@thechosenone'
    fill_in 'peep', with: 'Harry Potter that\'s me'
    click_button 'Post'
    expect(page).to have_content "Harry Potter that\'s me"
  end
end
