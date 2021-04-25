require 'timecop'
feature 'Viewing chitter' do
  # before do
  #   Timecop.freeze("17:00")
  # end

  # after do
  #   Timecop.return
  # end

  scenario 'A user can visit the homepage' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
    expect(page).to have_selector(:link_or_button, 'Send a peep')
  end

  scenario 'A user can send a peep' do
    send_a_peep
    expect(current_path).to eq '/home'
    expect(page).to have_content 'Hello, Chitter world!'
  end

  # scenario 'A user can see the time a peep was made' do
  #   Timecop.freeze("17:00") do
  #     # DatabaseConnection.query("INSERT INTO peeps (texts, time) VALUES ('Hello chitter', '15:00');")
  #     send_a_peep
  #     expect(page).to have_content("Peeped on 25 Apr 2021 at 17:00")
  #   end
  # end

end