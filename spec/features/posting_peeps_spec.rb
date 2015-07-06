feature 'User Peeps' do

  let(:peep) do
    build(:peep)
  end

  let(:user) do
    create(:user)
  end

  scenario 'can create a new peep' do
    visit('/sign_in')
    sign_in(user)
    visit('/peeps/new')
    expect{ post_message(peep) }.to change(Peep, :count).by(1)
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content("#{peep.message}")
    end
  end

  scenario "can't post an empty peep" do
    visit('/sign_in')
    sign_in(user)
    visit('/peeps/new')
    click_button 'Post Peep'
    expect(page).to have_content('Sorry, there were the following problems with the form.')
  end


  scenario 'can see when a peep was created' do
    visit('/sign_in')
    sign_in(user)
    visit('/peeps/new')
    post_message(peep)
    expect(page).to have_content("#{peep.created_at}")
  end
end
