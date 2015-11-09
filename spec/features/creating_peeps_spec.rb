feature 'Creating links' do

  let(:user) do
    User.create(email: 'user@example.com',
              password: 'secret123',
              password_confirmation: 'secret123')
  end

  scenario 'I can create a new link' do
    sign_in(email: user.email,   password: user.password)
    visit '/peep/new'
    fill_in 'peep', with: 'This is Zombocom'
    click_button 'Create Peep'

    expect(current_path).to eq '/peep'

    within 'ul#peep' do
      expect(page).to have_content('This is Zombocom')
    end
  end
end