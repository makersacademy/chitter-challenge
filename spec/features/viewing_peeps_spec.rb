feature 'viewing peeps' do

  scenario 'A peep includes the peepers name and username' do
    sign_up
    log_in
    visit('/peeps/new')
    fill_in(:message, with: 'This is a peep')
    click_button('Post')
    expect(page).to have_content("Chris (Wynndow)\nThis is a peep")
  end

  scenario 'peeps should be in reverse chronological order' do
    sign_up
    log_in
    5.times do |x|
      visit('/peeps/new')
      fill_in(:message, with: "#{x + 1}")
      click_button('Post')
    end
    expect(page).to have_selector("ul#peeps li:nth-child(1)", text: '5')
    expect(page).to have_selector("ul#peeps li:nth-child(2)", text: '4')
    expect(page).to have_selector("ul#peeps li:nth-child(3)", text: '3')
    expect(page).to have_selector("ul#peeps li:nth-child(4)", text: '2')
    expect(page).to have_selector("ul#peeps li:nth-child(5)", text: '1')
  end

  scenario 'peeps should include a timestamp' do
    sign_up
    log_in
    visit('/peeps/new')
    fill_in(:message, with: 'This is a peep')
    Timecop.freeze do
      click_button('Post')
      expect(page).to have_content("Chris (Wynndow)\nThis is a peep\n#{Time.now.strftime("%d/%m/%Y at %H:%M")}")
    end

  end

end
