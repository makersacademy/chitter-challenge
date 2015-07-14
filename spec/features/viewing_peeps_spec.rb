feature 'Viewing peeps' do

  let!(:user) do
    user = create :user
  end

  let(:peep) do
    peep = build :peep
  end

  scenario 'can view peeps' do
    sign_in(user)
    post(peep)
    expect(page).to have_content('Hello, world')
  end

  scenario 'peeps contain time created' do
    sign_in(user)
    Timecop.freeze(Time.local(2015))
    post(peep)
    expect(page).to have_content("00:00 01/01/2015")
    Timecop.return
  end

  scenario 'peeps contain username' do
    sign_in(user)
    post(peep)
    expect(page).to have_content('Author: Natso')
  end

  scenario 'peeps contain name' do
    sign_in(user)
    post(peep)
    expect(page).to have_content('(Natalie)')
  end
end