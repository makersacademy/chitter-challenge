feature 'Adding and viewing comments' do    
  scenario 'a comment is added to a peep' do
    peep = Peep.create(text: 'test peep')

    visit '/peeps'
    first('.peep').click_button 'Add Comment'

    expect(current_path).to eq "/peeps/#{peep.id}/comments/new"

    fill_in 'comment', with: 'This is a test comment'
    click_button 'Submit'

    expect(current_path).to eq '/peeps'
    expect(first('.peep')).to have_content 'This is a test comment'
  end

end
