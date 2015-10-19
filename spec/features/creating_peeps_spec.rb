feature 'Creating Peeps' do

  let(:user) do
    User.create(name: 'test',
                username: 'test',
                email: 'test@test.com',
                password: '12345',
                password_confirmation: '12345')
  end

  before do
    Timecop.freeze(Time.local(2015))
  end

  after do
    Timecop.return
  end

  scenario 'I can create a new peep' do
    sign_in(email: 'test@test.com', password: '12345')
    visit '/peeps/new'
    fill_in 'peep',   with: 'testing testing 123'
    click_button 'Create Peep'
    expect(current_path).to eq '/peeps'
    within 'div#peep' do
      expect(page).to have_content('testing testing 123')
      expect(page).to have_content('01/01/2015 00:00')
    end
  end
end
