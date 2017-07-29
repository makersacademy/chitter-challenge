feature 'Viewing peeps' do

  scenario 'I can views peeps on the timeline' do
    peep = Peep.create(message: "Today is a great day!")

    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
    expect(page).to have_content "Today is a great day!"
    expect(page).to have_content "Posted at: #{peep.created_at}"
    end
  end
end
