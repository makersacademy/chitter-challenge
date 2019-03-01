require './spec/db_helper'
require 'date'
require_relative 'web_helper'

feature 'feed' do
  before(:each) do 
    @peeps = create_peeps
    visit('/feed')
  end

  scenario 'should display all peeps' do
    expect(page.all('.peep').count).to eq(@peeps.count)
  end

  scenario 'should display peeps in reverse chronological order' do
    page.first('.peep')
    
    expect(page.first('.peep')).to have_content(@peeps.last.content)
  end

  feature 'posting new peep' do
    context 'regardless of whether user is logged in or not' do
      before(:each) do 
        post_peep('THEY TOOK OUR JORRRRRBBBSSSS!')
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

    context 'given user is logged in' do
      let(:username) { 'simon88' }
      let(:password) { 'penmousekeys' }

      before(:each) do 
        create_user(username: username, password: password)
        login(username: username, password: password)
      end

      scenario 'should display username that posted peep' do
        post_peep('THEY TOOK OUR JORRRRRBBBSSSS!')

        displayed_peep = page.find("##{@peeps[0].id}")
        expect(displayed_peep).to have_content(username)
      end
    end
  end
end
