feature 'creation of new peeps' do

  feature 'main page has a form to send a new peep when logged in' do

    before :each do
      register_to_site
    end

    scenario 'new peep form has a text field' do
      expect(page).to have_field 'peep_text'
    end

    scenario 'new peep form has a submit button' do
      expect(page).to have_button 'peep'
    end

  end

  feature 'main page has no form is the user is not logged in' do

    before :each do
      visit '/peeps'
    end

    scenario 'page has no peep button' do
      expect(page).not_to have_button 'peep'
    end

    scenario 'page has a warning explaining why user can not peep' do
      expect(page).to have_content 'You can not peep until you log in'
    end

  end



end
