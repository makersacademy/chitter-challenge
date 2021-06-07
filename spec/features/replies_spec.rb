feature 'Feature: Post a Shout' do
  scenario 'User creates a message and posts it to shouter' do
    visit '/'
    fill_in 'shout_box', with: 'THIS IS MY FIRST SHOUT'
    click_button 'SHOUT'
    first('.replies').click_on 'replies'
    expect(page).to have_content("SHOUT BACK")
    fill_in 'reply_box', with: 'WHY ARE YOU SHOUTING?'
    click_button 'SHOUT BACK'
    expect(page).to have_content("WHY ARE YOU SHOUTING?")
  end
end
