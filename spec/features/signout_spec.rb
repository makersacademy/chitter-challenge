feature 'a user can signout' do

  scenario 'a user signs out' do
    visit '/'
    click_button('Sign Out')
    expect(page).to have_content 'Goodbye!'
  end

end
