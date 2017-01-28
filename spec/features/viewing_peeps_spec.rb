feature 'Viewing the peep feed' do
  scenario 'I can view the feed of all peeps when logged in' do
    sign_up
    peep
    expect(page).to have_content 'Cloud Strife - @buster_sword'
    expect(page).to have_content 'Hello world, this is my first Peep!!'
  end
  scenario 'I can view the feed of all peeps when logged out' do
    sign_up
    peep
    sign_out
    expect(page).to have_content 'Cloud Strife - @buster_sword'
    expect(page).to have_content 'Hello world, this is my first Peep!!'
  end
  scenario 'I can see the time that a peep was posted' do
    sign_up
    peep
    timestamp = Time.now.strftime "on %a %d %b at %H:%M"
    sign_out
    expect(page).to have_content "Cloud Strife - @buster_sword #{timestamp}"
  end
end
