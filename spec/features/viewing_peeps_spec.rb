feature 'Viewing Peeps' do

  before do
    @user = build(:user)
    Timecop.freeze(Time.local(2015))
  end

  after do
    Timecop.return
  end

  scenario 'I can see existing peeps on peeps page' do
    peep = Peep.new(peep: 'testing testing 123')
    peep.user = @user
    peep.save
    visit '/peeps'
    expect(page.status_code).to eq(200)
    within 'div#peep' do
      expect(page).to have_content('testing testing 123')
      expect(page).to have_content('01/01/2015 00:00')
    end
  end
end
