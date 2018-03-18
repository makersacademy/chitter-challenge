require_relative '../../app.rb'

describe PhoenixController do

  before do
    visit '/phoenix'
  end

  feature 'CRUD' do

    scenario 'CREATE a Phoenix' do
      fill_in 'new_phoenix', with: "You summoned a new Phoenix!"
      click_on 'summon_phoenix'
      expect(page).to have_content "You summoned a new Phoenix!"
    end

    scenario 'READ a Phoenix' do
      expect(page).to have_content "OMG Final Fantasy is the best!"
      expect(page).to have_content "I completely agree."
      expect(page).to have_content "You guys sound like awesome people"
    end

    context 'UPDATE a Phoenix' do
      scenario 'but cancel' do
        click_on 'reraise_4'
        click_on 'reraise_cancel'
        expect(page).to have_content "You summoned a new Phoenix!"
      end
      
      scenario 'and submit' do
        click_on 'reraise_4'
        fill_in 'reraise_text', with: 'This is a phoenix that has been re-raised'
        click_on 'reraise_confirm'
        expect(page).to have_content 'This is a phoenix that has been re-raised'
      end
    end

    context 'DELETE a Phoenix' do
      scenario 'and confirm' do
        click_on 'dismiss_4'
        #click_on 'confirm_dismiss'
        expect(page).not_to have_content 'This is a Phoenix that has been re-raised'
      end

      #scenario 'but cancel' do
        #click_on 'dismiss_phoenix_5'
        #click_on 'cancel_dismiss'
        #expect(page).to have_content 'This is a Phoenix that has been re-raised'
      #end
    end

  end
end
