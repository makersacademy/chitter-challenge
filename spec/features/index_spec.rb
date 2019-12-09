RSpec.feature 'testing' do
  scenario 'user visits the homepage' do
    sign_up_and_sign_in
    fill_in 'new-peep', with: 'this is my first peep!'
    click_on 'Send Peep'

    expect(page).to have_content 'this is my first peep!'
  end
end
