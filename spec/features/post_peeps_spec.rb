feature 'Post peeps' do
  include SessionHelpers

  scenario 'Allows a user who just signed up to post a peep' do
    sign_up
    fill_in :user_peep, with: 'I am making a chitter app!'
    click_button 'Peep'
    expect(page).to have_content 'I am making a chitter app!'
    expect(page).to have_content 'Sent by: chun-li'
    expect(page).to have_content "Date/time: #{Peep.last.time.strftime '%d-%m-%Y %I:%M %p'}"
   end
  end
