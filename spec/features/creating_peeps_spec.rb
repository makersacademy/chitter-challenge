feature 'creating peeps' do

  let(:user) {build :user}

  before do
    user.save
  end

  scenario 'I can submit a new peep' do
    sign_in(user)
    visit '/peeps/new'
    fill_in 'content', with: 'Hello, is it me you\'re looking for?'
    click_button 'Submit'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('Hello, is it me you\'re looking for?')
    end
  end
end
