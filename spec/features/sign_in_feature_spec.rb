feature 'sign up' do
  scenario 'it should sign you up after you give the required details' do
    visit '/'
    click_button 'sign in'
    fill_in('username', with: 'ahopkins94')
    fill_in('password', with: 'hello')
    click_button 'submit'
    expect(page).to have_content "Welcome ahopkins94"
  end
end
