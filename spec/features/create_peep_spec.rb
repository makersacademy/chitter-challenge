feature 'create a peep' do
  scenario 'signed in user may create a peep' do
    sign_up
    expect(current_path).to eq '/'
    peep
    expect(current_path).to eq '/'
    within 'ul#peeps' do
      expect(page).to have_content 'This is Ed\'s peep'
    end
  end

  scenario 'only signed-in users may peep' do
    visit '/peeps/new'
    expect(current_path).to eq '/'
    expect(page).to have_content 'You must be signed in to peep!'
  end

end
