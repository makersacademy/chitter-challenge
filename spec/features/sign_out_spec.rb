def sign_out
  visit('/peeps')
  click_button('Logout')
end

feature 'Feature: signing out' do
  scenario 'while signed in' do
    sign_in
    click_button('Logout')
    expect(page).to_not have_content 'Welcome, person'
  end

  scenario 'when not signed in' do
    expect(page).to_not have_content 'Logout'
  end
end
