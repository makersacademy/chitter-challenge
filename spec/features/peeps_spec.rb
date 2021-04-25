feature 'peeps' do
  scenario 'user can post a peep' do
    post_first_peep

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'this is the first peep'
  end

  scenario 'user can view all peeps listed newest to oldest' do
    post_first_peep
    post_second_peep

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'this is the second peep'
    expect(page).to have_content 'this is the first peep'
  end
end
