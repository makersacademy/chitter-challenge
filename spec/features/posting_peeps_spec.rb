feature 'Posting peeps' do

  scenario 'I can create a new peep' do
    sign_up
    expect{post_peep}.to change(Peep, :count).by 1
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'This is a peep'
  end

  scenario 'user can\'t peep unless signed in' do
    post_peep
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "You must sign in to post a peep"
  end

end
