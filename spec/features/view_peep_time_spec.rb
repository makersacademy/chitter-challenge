feature 'Viewing peep date and time stamp' do
  scenario 'I can see when a peep was posted' do
  post_a_peep(test_peep_one)
  expect(page).to have_content "#{test_peep_one} #{Time.now.strftime("%H:%M")} #{Time.now.strftime("%g %h")}"
  end
end
