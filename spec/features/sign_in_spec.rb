feature 'user can sign in' do
  scenario 'user passes in username and password too sign in' do
    visit '/'
    click_link 'sign_up'
    fill_in 'name', with: 'Andy'
    fill_in 'email', with: 'andy_the_legend@legends.com'
    fill_in 'username', with: 'andy_loves_tests'
    fill_in 'password', with: '12345'
    click_button 'Submit'
    visit '/'
    fill_in 'username', with: 'andy_loves_tests'
    fill_in 'password', with: '12345'
    click_button 'Submit'
    expect(page).to have_content 'User: andy_loves_tests'
  end
end
