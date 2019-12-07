RSpec.feature 'peep format' do
  before(:each) do
    sign_up_and_sign_in
    15.times {
      fill_in 'new-peep', with: 'this is a peep'
      click_on 'Send Peep'
    }
  end

  scenario 'user wants to see how many peeps they have peeped' do
    expect(page).to have_content 'Peeps'
    expect(page).to have_content '15'
  end

  scenario 'user wants to see how many luvs a peep has' do
    find('#luv-peep-13').click
    expect(page).to have_content 'Luvs'
    expect(page).to have_content '1'
  end

  scenario 'user wants to know what time they sent each peep' do
    expect(page).to have_content "Peeped at #{Time.now.utc.strftime('%k:%M')}"
  end
end
