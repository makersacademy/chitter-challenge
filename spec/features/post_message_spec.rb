feature 'Post message' do
  scenario 'posts a message' do
    visit('/')
    fill_in 'message', with: 'my first peep!'
    click_button 'peep'
    expect(page).to have_current_path('/')
    expect(page).to have_content 'my first peep!'
  end
end
