feature 'User posts a Roll' do
  before(:each) do
    sign_up
  end

  scenario 'Signed In User fills out roll and posts it' do
    post_roll(message: "Never going to give you up")
    expect(page).to have_content "Never going to give you up"
  end

  scenario 'Username is Put in a Roll' do
    post_roll
    expect(page).to have_content(SessionHelpers::DEFAULT_USERNAME)
  end

  scenario 'Name is Put in a Roll' do
    post_roll
    expect(page).to have_content(SessionHelpers::DEFAULT_NAME)
  end

  scenario 'Rolls are posted in Chronological Order' do
    time1 = Time.now
    time2 = Time.now - 3600
    time3 = Time.now + 3600

    allow(Time).to receive(:now) { time1 }
    post_roll(message: "Now")

    allow(Time).to receive(:now) { time2 }
    post_roll(message: "Before")

    allow(Time).to receive(:now) { time3 }
    post_roll(message: "After")

    expect(page.find('li:nth-child(1)')).to have_content 'After'
    expect(page.find('li:nth-child(2)')).to have_content 'Now'
    expect(page.find('li:nth-child(3)')).to have_content 'Before'

  end




  scenario 'A roll saves with a time and displays a time in the feed' do
    time = Time.now
    formatted_time = time.strftime("at %k:%M on %d/%m/%y")
    allow(Time).to receive(:now) { time }

    post_roll(message: "Never going to give you up")
    expect(page).to have_content "#{formatted_time}"
  end

end
