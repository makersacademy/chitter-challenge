require 'pg'

feature "Timestamp" do
  scenario "Peeps have a timestamp of when they were last modified" do

    connection = PG.connect(dbname: 'chitter_test')
    Peeps.create(username: 'rorschach12', peep: 'I am not sure if I am qualified to be doing this')

    visit '/'
    click_link('Chitter Feed')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content Time.now.strftime("%d/%m/%Y %k:%M")
  end
end

