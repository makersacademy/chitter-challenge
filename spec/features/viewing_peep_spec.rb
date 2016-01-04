# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'Client viewing peeps' do
  scenario 'I want to see all peeps in reverse chronological order' do
    sign_up
    sign_in
    3.times do |x|
      visit '/peeps/mew'
      fill_in 'message', with: "Peep number #{x}"
      click_button 'Post'
    end

    expect(page).to have_selector("ul#peeps li:nth-child(1)", text: 'Peep number 3')
    expect(page).to have_selector("ul#peeps li:nth-child(2)", text: 'Peep number 2')
    expect(page).to have_selector("ul#peeps li:nth-child(3)", text: 'Peep number 1')
  end

  # As a maker
  # So that I can better appreciate the context of a peep
  # I want to see the time at which it was made

  scenario 'I want to see the time at which peep was made' do
    sign_up
    sign_in
    visit('/peeps/new')
    fill_in 'message', with: 'Testing time'

    Timecop.freeze do
      click_button 'Post'
      expect(page).to have_content("Name-Surname \n Testing time \n #{Time.now.strftime("%d%m%Y at %H:%M")}")
    end
  end
end
