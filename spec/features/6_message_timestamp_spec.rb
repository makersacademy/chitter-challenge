feature '6: message timestamps' do

  before do
    Timecop.freeze(Time.local(2017, 1, 29, 10, 5, 0))
  end

  scenario 'user that is logged in can see the time that all peeps were posted' do

    sign_up
    login

    post_peep

    within('div#peep') do
      expect( page ).to have_content('Posted on 29 January 2017 at 10:05')
    end

  end
end
