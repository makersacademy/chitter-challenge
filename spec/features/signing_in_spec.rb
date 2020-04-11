feature 'signing in' do
  scenario 'should be able to sign in after signing up' do
    visit('/')
    click_button('sign up')
    fill_in('username', :with => 'eddoddo')
    fill_in('password', :with => 'Secure_PW')
    fill_in('email address', :with => 'edd0ddi0@gmail.com')
    click_button('submit')
    visit('/')
    expect(page).to have_button('sign in')
    click_button('sign in')
    expect(page).to have_field('username')
    fill_in('username', :with => 'eddoddo')
    expect(page).to have_field('password')
    fill_in('password', :with => 'Secure_PW')
    expect(page).to have_button('log in')
    click_button('log in')
    expect(page).to have_content('Welcome, eddoddo')
    expect(page).to have_button('view peeps')
    expect(page).to have_button('new peep')
  end
end