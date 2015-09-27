feature 'Viewing Peeps' do

  before do
    @user = build(:user)
  end

  scenario 'I can see existing peeps on peeps page' do
    peep = Peep.new(peep: 'testing testing 123')
    peep.user = @user
    peep.save
    visit '/peeps'
    expect(page.status_code).to eq(200)
    within 'div#peep' do
      expect(page).to have_content('testing testing 123')
    end
  end
end

feature 'Creating Peeps' do

  let(:user) do
    User.create(name: 'test',
                username: 'test',
                email: 'test@test.com',
                password: '12345',
                password_confirmation: '12345')
  end

  scenario 'I can create a new peep' do
    sign_in(email: 'test@test.com', password: '12345')
    visit '/peeps/new'
    fill_in 'peep',   with: 'testing testing 123'
    click_button 'Create Peep'

    # we expect to be redirected back to the links page
    expect(current_path).to eq '/peeps'

    within 'div#peep' do
      expect(page).to have_content('testing testing 123')
    end
  end
end
