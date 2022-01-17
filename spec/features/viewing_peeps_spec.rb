feature 'viewing peeps' do
  scenario 'user can view peeps in reverse chronological order' do
    post_peep("Hello peep 1")
    post_peep("Hi peep 2")
    post_peep("What's up peep 3")

    expect(current_path).to eq '/chitter'
    expect(first('.peep')).to have_content "What's up peep 3"
  end

  scenario 'user can view peeps in reverse chronological order' do
    post_peep("What time is it?")

    expect(current_path).to eq '/chitter'
    expect(page).to have_css ".timestamp"
  end

  scenario 'user can see time peep was posted' do
    post_peep("What time is it?")
    time = Time.new.strftime("%d/%m/%Y at %k:%M")

    expect(current_path).to eq '/chitter'
    expect(page).to have_content time
  end
end
