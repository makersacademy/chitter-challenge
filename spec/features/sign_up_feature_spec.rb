feature 'sign up' do
  scenario 'it should sign you up after you give the required details' do
    visit '/peeps'
    click_button 'sign up'
    fill_in('email', with: 'anouskahopkins@gmail.com')
    fill_in('password', with: 'hello')
    fill_in('name', with: 'anouska hopkins')
    fill_in('username', with: 'ahopkins94')
    click_button 'submit'
    expect(page).to have_content "Welcome ahopkins94"
  end
end
