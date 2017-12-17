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

    scenario 'Should display all peeps in chronological order' do
      submit_peep
      submit_peep_2
      expect(page.find('li:nth-child(2)')).to have_content 'testing'
      expect(page.find('li:nth-child(1)')).to have_content 't3sting2'
    end

  end

end
