feature 'comment' do
  scenario "user can comment on another user's comment" do
    sign_up(username: 'GinnyWeasly', email: 'ginny_weasly@hogwarts.co.uk',
      password: 'HarryPotter',   password_confirmation: 'HarryPotter')
    fill_in 'peep', with: 'Oh Harry Potter is the coolest'
    click_button 'Peep!'
    click_button 'Log out'
    sign_up
    first('.peep').click_button 'Comment'
    fill_in 'comment', with: 'Yes I agree'
    click_button 'Comment!'
    expect(current_path).to eq '/'
    expect(first('.peep')).to have_content 'Yes I agree'
  end

  scenario "user can't comment if not logged in" do
    sign_up(username: 'GinnyWeasly', email: 'ginny_weasly@hogwarts.co.uk',
      password: 'HarryPotter',   password_confirmation: 'HarryPotter')
      fill_in 'peep', with: 'Oh Harry Potter is the coolest'
      click_button 'Peep!'
      click_button 'Log out'
      sign_up
      click_button 'Log out'
      expect(page).not_to have_content 'Comment!'
  end
end
