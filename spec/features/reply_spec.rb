feature 'Reply' do


  scenario 'button should not be present if user not logged in' do
    visit '/posts/view'
    expect(page).not_to have_button 'Reply'
  end

end