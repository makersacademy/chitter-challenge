feature 'Peeps' do
  let(:user) do
    User.create(SessionHelpers::PARAMS_CORRECT)
  end

  context 'Viewing peeps' do
    scenario 'I can see existing peeps on the peeps page' do
      sign_in_and_peep("what a chit!")
      visit '/peeps'
      expect(page.status_code).to eq 200
      within 'ul#peeps' do
        expect(page).to have_content "what a chit!"
      end
    end
  end

  context 'Add peeps' do
    scenario 'if not logged in can\'t add peeps' do
      visit '/peeps/new'
      expect(page).to have_content "Please sign in"
    end

    scenario 'I can add peeps to chitter when logged in' do
      sign_in_and_peep("hey I am chitting")
      expect(current_path).to eq '/peeps'
      expect(page).to have_content "hey I am chitting"
    end

    scenario 'peeps contain name, username, and timestamp' do
      sign_in_and_peep("test Message")
      expect(page).to have_content(user.name)
      # expect(page).to have_content(user.username)
    end
  end
end