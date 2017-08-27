require_relative './../../models/peep'

feature Chitter do
  context '/' do
    it 'can submit email, password, name & username' do
      sign_up
      expect(page).to have_text('Logged in as: jellybean454')
    end

    scenario 'signing into Chitter' do
      sign_up
      sign_in
      expect(page).to have_text('Logged in as: jellybean454')
    end
  end

  context '/new' do
    before do
      visit '/new'
    end
    scenario 'it can send a peep' do
      fill_in('new_peep', with: 'First peep!')
      find_button('Submit').click
    end
  end

  context '/peeps' do
    scenario 'show peeps in reverse chronological order' do
      new_peep
      other_peep
      within 'ul#peeplist' do
        expect(page).to have_text('First peep!')
        expect(page).to have_text('Second peep!')
      end
    end

    it 'shows the tweet time' do
      peep1 = Peep.create(content: 'Testing time')
      peep2 = Peep.create(content: 'Testing time 2')
      visit '/peeps'
      within 'ul#peeplist' do
        expect(page).to have_text(peep1.created_at)
        expect(page).to have_text(peep2.created_at)
      end
    end

    scenario 'peeps posted by users' do
      sign_up
      new_peep
      expect(page).to have_text('Stephen Geller (jellybean454): First peep! ')
    end

    it 'shows current user when logged in' do
      sign_up
      expect(page).to have_text('Logged in as: jellybean454')
    end

    it 'does not show current user when not logged in' do
      visit '/peeps'
      expect(page).to_not have_text('Logged in as: jellybean454')
    end
  end
end
