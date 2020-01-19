feature 'add timestamp to post' do
  scenario 'user created peep with timestamp added automatically' do
    time = Time.now
    visit('/peep/new')
    fill_in 'user_name', with: 'Harry'
    fill_in 'user_handle', with: '@thechosenone'
    fill_in 'peep', with: 'Harry Potter that\'s me'
    click_button 'Post'
    expect(page).to have_content '2020-01-19'
  end
end