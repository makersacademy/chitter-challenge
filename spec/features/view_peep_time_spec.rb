feature 'Viewing peep date and time stamp' do

  before(:each) do
    sign_up_first
  end

  scenario 'I can see when a peep was posted' do
  post_a_peep(test_peep_one)
  expect(page).to have_content "#{Time.now.strftime("%H:%M")} #{Time.now.strftime("%g %h")} #{test_peep_one}"
  end

end
