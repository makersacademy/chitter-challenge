feature 'Posting peeps' do

  let(:user) { user = create(:user) }

  scenario 'I can create a new peep' do
    sign_in(user)
    expect{post_peep}.to change(Peep, :count).by 1
    expect(current_path).to eq '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content 'This is a peep'
    end
  end

  scenario 'user can\'t peep unless signed in' do
    post_peep
    expect(current_path).to eq '/peeps/new'
    expect(page).to have_content "You must sign in to post a peep"
  end

end
