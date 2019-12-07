RSpec.feature 'log in' do
  scenario 'user logs into their account' do
    sign_up_and_sign_in

    expect(page).to have_content 'Sam123\'s Peeps'
  end
end
