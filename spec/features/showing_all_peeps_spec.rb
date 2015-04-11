feature 'Viewing peeps' do

  scenario 'on the homepage' do
    add_peep
    visit '/'
    expect(page).to have_content('test')
  end

  scenario 'in reverse chronological order' do
    add_peep '1st'
    sleep 1.0
    add_peep '2nd'
    sleep 1.0
    add_peep '3rd'
    visit '/'
    expect(page).to have_content('3rd 2nd 1st')
    expect(page).not_to have_content('test')
  end

end

def add_peep content = 'test'
  post = Peep.create(content: content, time: Time.new)
  p post.saved?
end