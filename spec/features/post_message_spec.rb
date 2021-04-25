feature 'Post message' do
  scenario 'posts a message' do
    visit('/')
    fill_in 'message', with: 'my first peep!'
    click_button 'peep'
    expect(page).to have_current_path('/')
    expect(page).to have_content 'my first peep!'
  end

  scenario 'shows latest posted message first' do
    visit('/')
    fill_in 'message', with: 'first message'
    click_button 'peep'
    fill_in 'message', with: 'second message'
    click_button 'peep'
    first_index = page.body.index('first message')
    second_index = page.body.index('second message')
    expect(first_index).to be > second_index
  end
end
