
feature 'Register for chitter' do
  scenario 'a user wishes to sign up for chitter' do
    visit('/user/new')
    fill_in('username', with: 'stephanief')
    fill_in('email', with: 'steph@isawesome.com')
    fill_in('password', with: 'STEPHANIEISAMAZINGGGGGGGGGGG!')
    expect(page).to have_content "stephanief"
  end
end
