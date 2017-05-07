feature 'Users' do

  let!(:user) do
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



end
