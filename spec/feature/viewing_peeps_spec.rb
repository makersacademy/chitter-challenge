require "timecop"

feature 'viewing' do

  scenario 'I want to see what time a peep was made' do

    Timecop.freeze do
      Peep.create(content: 'what a fabulous day')

      visit '/peeps'
      within 'ul#peeps' do
        expect(page).to have_content DateTime.now.strftime("%I:%M%p, %m/%d/%Y")
      end
    end
  end


end
