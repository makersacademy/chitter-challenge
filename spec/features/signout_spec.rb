feature 'a user can signout' do

  scenario 'a user signs out' do
    sign_up
    visit '/'
    click_button('Sign Out')
    expect(page).to have_content 'Goodbye!'
  end


end
