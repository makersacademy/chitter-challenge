require 'web_helper.rb'

feature do

  context 'logging in as Becka' do

    before do
      User.add(username: 'Becka', email: 'notarealemail12345@hotmail.co.uk', password: 'fakepassword')
      log_in
      peep('My first peep')
    end

    scenario 'visits homepage' do
      expect(page).to have_content('Welcome back to chitter')
    end

    scenario 'sees peeps' do
      expect(page).to have_content('My first peep')
    end

    scenario 'adds peep' do
      peep('My second peep')
      expect(page).to have_content('My second peep')
    end

    scenario 'adds multiple peeps' do
      peep('My second peep')
      peep('My third peep')
      expect(page).to have_content('My second peep')
      expect(page).to have_content('My third peep')
    end

    scenario 'peeps have timestamps and usernames' do
      allow(Time).to receive(:now).and_return("2018-10-26 15:55:19")
      peep('My second peep')
      expect(page).to have_content("2018-10-26 15:55:19")
      expect(page).to have_content "Posted by: Becka"
    end

    scenario 'cannot peep unless logged in' do
      click_on 'log out'
      peep('My second peep')
      expect(page).to have_content('You must log in to peep')
    end

  end

  context 'logging in as Jess' do

    before do
      User.add(username: 'Jess', email: 'anotherfakeemail12345@hotmail.co.uk', password: 'fakepassword')
      log_in('Jess')
    end

    scenario "peeps show who posted them" do
      peep("Jess first peep")
      expect(page).to have_content "Jess first peep"
      expect(page).to have_content "Posted by: Jess"
    end

  end

end
