feature 'Peeping' do
  before(:each) { Timecop.freeze(Time.local(2018)) }
  after(:each) { Timecop.return }

  context 'successfully' do
    before(:each) { sign_up('test@testing.com', 'secret_pass', 'secret_pass', 'Test Bloggs', 'testy') }

    scenario 'displays a message and time' do
      add_peep('I ate a sandwich.')
      expect(current_path).to eq '/peeps'
      expect(page).to have_content('I ate a sandwich.')
      expect(page).to have_content('01/01/2018 00:00')
    end

    scenario 'displays a peeper\'s name and username' do
      add_peep('I ate some eggs.')
      expect(page).to have_content('peeped by user testy (Test Bloggs)')
    end

    scenario 'are displayed in reverse chronological order' do
      add_peep('I ate a sandwich.')
      Timecop.freeze(Time.local(2019))
      add_peep('I ate some crisps.')
      expect('I ate some crisps.').to appear_before('I ate a sandwich.')
    end
  end

  context 'unsuccessfully' do
    scenario 'without a message' do
      sign_up('test@testing.com', 'secret_pass', 'secret_pass', 'Test Bloggs', 'testy')
      add_peep('')
      expect(Peep.all.count).to eq 0
      expect(current_path).to eq '/peeps/new'
    end

    scenario 'when not logged in' do
      add_peep('I ate a watermelon.')
      expect(Peep.all.count).to eq 0
      expect(current_path).to eq '/peeps/new'
    end
  end
end
