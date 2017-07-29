feature 'Viewing peeps' do
  scenario 'I can views peeps on the timeline' do
    Peep.create(message: "Today is a great day!")

    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
    expect(page).to have_content "Today is a great day!"
    end
  end
end
