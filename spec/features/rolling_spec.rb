feature 'User posts a Roll' do
  before(:each) do
    sign_up
  end

  scenario 'Signed In User fills out roll and posts it' do
    post_roll(message: "Never going to give you up")
    expect(page).to have_content "Never going to give you up"
  end

  scenario 'Username and Name are Put in a Roll' do
    post_roll
    expect(page).to have_content(SessionHelpers::DEFAULT_USERNAME)
  end

  scenario 'Username and Name are Put in a Roll' do
    post_roll
    expect(page).to have_content(SessionHelpers::DEFAULT_NAME)
  end



  scenario 'A roll saves with a time and displays a time in the feed' do
    time = Time.now
    formatted_time = time.strftime("at %k:%M on %d/%m/%y")
    allow(Time).to receive(:now) { time }

    post_roll(message: "Never going to give you up")
    expect(page).to have_content "#{formatted_time}"
  end

end
