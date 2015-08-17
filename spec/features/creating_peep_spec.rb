feature 'Creating Peeps' do

  let(:user) do
    user = create :user
  end

  scenario 'can post a new peep to Chitter' do
    expect(Peep.count).to eq(0)
    sign_in(email: user.email,   password: user.password)
    visit '/peeps/new_peep'
    fill_in 'text', with: 'peep message'
    click_button 'Submit peep'
    expect(Peep.count).to eq(1)
  end

  scenario 'can only peep if logged in' do
    expect(Peep.count).to eq(0)
    visit '/peeps/new_peep'
    fill_in 'text', with: 'peep message'
    click_button 'Submit peep'
    expect(Peep.count).to eq(0)
    expect(page).to have_content('Please log in or register to create a peep')
  end
end
