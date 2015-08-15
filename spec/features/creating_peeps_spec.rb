feature 'Creating peeps' do
  let(:user) { build(:user) }

  scenario 'User can only create a new peep when logged in' do
    sign_up(user)
    create_peep
    expect(current_path).to eq('/')
    within 'ul#peeps' do
      expect(page).to have_content('This is a test peep.')
    end
  end

  scenario 'User cannot create a new peep when not logged in' do
  end
end
