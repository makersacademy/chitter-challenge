require_relative '../../app.rb'

feature "testing infrastructure" do

  feature '#time_line' do

    before do
      visit '/time_line'
    end

    scenario 'Should have a field for entering your peep' do
      expect(page).to have_field('peep')
    end

    scenario 'Should have a submit button to feed peep to time line' do
      expect(page).to have_button('peep')
    end

    scenario 'Should be able to submit peep to page' do
      submit_peep
      expect(page).to have_content('testing')
    end

  end

end
