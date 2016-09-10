require 'spec_helper'

feature 'Viewing peeps' do

  before(:each) do
    sign_up('abigail',
            'abi@test.com',
            'abimcp',
            'password123',
            'password123')
  end

  before { Timecop.freeze(Time.now) }

  scenario 'peeps are listed with the time of peeping' do
    add_peep
    within 'ul#peeps' do
      time = Time.now.strftime("peeped on %m/%d/%Y, at %I:%M%p")
      expect(page).to have_content time
    end
  end

end
