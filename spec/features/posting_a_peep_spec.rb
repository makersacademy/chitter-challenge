# frozen_string_literal: true

feature 'Posting a Peep' do
  scenario 'users should be able to post a peep' do
    make_a_user

    User.sign_in('c@d.com')

    visit('/signed_in')
    fill_in('content', with: 'A!')
    click_button('submit')
    expect(page).to have_content('A!')
  end
end
