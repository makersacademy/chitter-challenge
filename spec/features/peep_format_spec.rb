RSpec.feature 'peep format' do
  before(:each) do
    sign_up_and_sign_in
    50.times {
    fill_in 'new-peep', with: 'this is a peep'
    click_on 'Send Peep'
    }
  end

  scenario 'user wants to see how many peeps they have peeped' do
    expect(page).to have_content 'Peeps'
    expect(page).to have_content '50'
  end
end