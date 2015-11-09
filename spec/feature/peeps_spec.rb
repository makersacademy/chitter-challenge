feature 'Peeps' do

  before :each do
    sign_in
    make_peep
  end

  scenario 'user can post a new peep' do
    expect(Peep.count).to be 1
  end

  context 'the following is displayed:' do
    scenario 'the peep message' do
      expect(page).to have_content 'Test peep 01'
    end
    scenario 'the time of the peep' do
      test_time = Time.new
      allow(Time).to receive(:new) { test_time }
      expect(page).to have_content "#{ test_time.strftime("%e %b %Y %H:%M%p") }"
    end
    scenario 'the author of the peep' do
      within('ul.peeps') do
          expect(page).to have_content 'user1'
      end
    end
  end

  context 'with multiple peeps' do
    scenario 'peeps are listsed in reverse chronological order' do
      make_peep
      make_peep(message: "Test peep 02")
      expect(page.find('li:nth-child(1)')).to have_content 'Test peep 02'
      expect(page.find('li:nth-child(2)')).to have_content 'Test peep 01'
    end
  end



end
