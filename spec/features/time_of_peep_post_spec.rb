feature 'The time and date is shown' do
  scenario 'A user posts a peep and sees the time and date when it was posted' do
    sign_up
    add_first_peep
    expect(page).to have_content "#{Time.now.strftime("%Y-%m-%d %I:%M %p")}"
  end
end