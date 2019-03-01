require './spec/db_helper'
require 'date'

feature 'feed' do
  before(:each) do 
    @peeps = create_peeps
    visit('/feed')
  end

  scenario 'should display all peeps' do
    expect(page.all('.peep').count).to eq(@peeps.count)
  end

  feature 'posting new peep' do
    before(:each) do 
      content = 'THEY TOOK OUR JORRRRRBBBSSSS!'
      fill_in('content_input', with: content)
      click_button 'Submit'
    end

    scenario 'should post peep to feed' do
      expect(page.all('.peep').count).to eq(@peeps.count + 1)
    end

    scenario 'should display time when peep was posted' do
      displayed_peep = page.find("##{@peeps[0].id}")

      expected_post_time = @peeps[0].created_at.strftime(
        '%e %b %Y %H:%M:%S%p'
      )

      expect(displayed_peep).to have_content(expected_post_time)
    end
  end
end
