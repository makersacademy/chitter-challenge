feature 'post shout' do
  scenario 'User creates a message and posts it to shouter' do
    visit '/'
    fill_in 'shout_box', with: 'THIS IS MY FIRST SHOUT'
    click_button 'SHOUT'
    expect(page).to have_content("THIS IS MY FIRST SHOUT")
  end
end
