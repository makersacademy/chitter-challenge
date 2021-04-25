feature 'peeps' do
  scenario 'user can post a peep' do
    post_peep('this is the first peep')

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'this is the first peep'
  end

  scenario 'user can view all peeps listed newest to oldest' do
    post_peep('this is the first peep')
    post_peep('this is the second peep')

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'this is the second peep'
    expect(page).to have_content 'this is the first peep'
  end

  scenario 'it has a time stamp attached to it' do
    post_peep('peep with time stamp')

    expect(current_path).to eq '/peeps'
    peeps = Peep.list
    time = peeps[0].time
    expect(page).to have_content "peep with time stamp at #{time}"
  end
end
