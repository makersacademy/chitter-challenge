feature 'Peep replies' do
  scenario 'if a user is logged in, he can reply to peeps' do
    sign_up(email: 'one@email.com', username: 'one')
    post_a_peep
    click_button 'Sign Out'
    sign_up(email: 'two@email.com', username: 'two')
    visit '/peeps/one'
    within 'ul#peeps' do
      expect(page).to have_button 'Reply'
    end
  end

  scenario 'if no user is logged in, no reply button is shown' do
    sign_up
    post_a_peep
    click_button 'Sign Out'
    visit '/peeps/test_user'
    within '.item' do
      expect(page).not_to have_button 'Reply'
    end
  end

  scenario 'replying to a peep' do
    sign_up
    post_a_peep
    post_a_peep(content: 'Second peep')
    click_button 'Sign Out'
    sign_up(email: 'one@email.com', username: 'one')
    visit '/peeps/test_user'
    first('.item').click_button 'Reply'
    fill_in 'reply', with: 'This is a reply'
    click_button 'Reply'
    within find(:li, 1) do
      expect(page).to have_content 'This is a reply'
    end

  end
end
