# frozen_string_literal: true

feature 'signing up' do
  scenario 'a user can signup' do
    sign_up_user

    expect(page).to have_content 'Welcome, example@email.com'
  end

  scenario 'a user can create their own peep' do
    sign_up_user
    fill_in('peep', with: 'This is a peep')
    click_button('submit')

    expect(page).to have_content('example@email.com', count: 2)
  end

  scenario 'user is not signed up' do
    visit('/chitter')

    expect(page).to have_content 'Welcome, anonymouse'
  end
end
