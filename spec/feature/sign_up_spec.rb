feature 'sign_up' do
  scenario 'a user can sign up to Chitter' do
    visit '/users/new'
    fill_in('email', with: 'ben@test.com')
    fill_in('password', with: 'pa55word')
    click_button 'Submit'
    expect(page).to have_content "Hello, ben@test.com"
  end
end