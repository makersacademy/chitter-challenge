feature 'Users' do

  let!(:user) do
    email = 'user@example.com'
    password = 'secret*123'
    User.create(email: email, password: password, password_confirmation: password)
  end

  let!(:user_2) do
    email = 'user@example.com'
    password = 'secret*123'
    User.create(email: email, password: password, password_confirmation: password)
  end

  scenario 'can respond to peeps' do
    log_in
    post_peep
    click_link 'Respond to this peep'
    expect(page).to have_content 'Reply to this peep'
    reply = 'This is my reply to your peep'
    fill_in 'comment_content', with: reply
    click_button 'Reply'
    expect(page).to have_content reply
  end

  scenario 'can respond to other users peeps' do
    Peep.create(content: 'this is a peep', user_id: user.id)
    log_in(user_2.email, user_2.password)
    expect(page).to have_content "By #{user.email}"
    click_link 'Respond to this peep'
    expect(page).to have_content 'Reply to this peep'
    reply = 'This is my reply to your peep by user two'
    fill_in 'comment_content', with: reply
    click_button 'Reply'
    expect(page).to have_content reply
    expect(page).to have_content "By #{user_2.email}"
  end

  scenario 'cannot have responses over 150 characters long' do
    log_in
    post_peep
    click_link 'Respond to this peep'
    expect(page).to have_content 'Reply to this peep'
    reply = 'This is my really really really really really really really '\
    'really really really really really really really really really really '\
    'really really really really really really really long reply to your peep'
    fill_in 'comment_content', with: reply
    click_button 'Reply'
    expect(page).not_to have_content reply
    error = "Please keep responses between 5 and 150 characters long"
    expect(page).to have_content error
  end

end
