feature 'user can see post time' do

  before(:each) do
    create_user_alice
    log_in
  end

  scenario 'user can see the post time of the peep' do
    allow(DateTime).to receive(:now).and_return(Time.parse("Thu Nov 29 14:33:20 2001"))
    post(content: 'Hello')

    within 'ul#peeps' do
      expect(page).to have_content "Thu Nov 29 14:33:20 2001"
    end
  end

end