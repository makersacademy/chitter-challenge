feature 'create a peep' do
  scenario 'signed in user may create a peep' do
    sign_up
    expect(current_path).to eq '/peeps/new'
    peep
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content 'This is Ed\'s peep'
    end
  end

end
