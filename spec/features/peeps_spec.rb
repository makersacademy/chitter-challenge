feature 'Creating and Viewing Peeps' do

    before(:each) do
      @time_now = DateTime.new(2016,9,26)
      allow(DateTime).to receive(:new).and_return(@time_now)
      sign_up
      upload_peeps
      visit '/'
    end

    scenario "user can create see peeps " do

      expect(page).to have_content "First Peep"
      expect(page).to have_content "Second Peep"

    end

    scenario "users can see when peeps were created" do
      expect(page).to have_content(@time_now)
    end

    scenario 'peeps are in reverse chronological order' do
      expect("Second Peep").to appear_before("First Peep")
    end

  end
