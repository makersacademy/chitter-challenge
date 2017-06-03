feature 'Viewing peeps' do
  scenario 'users can see peeps in reverse chronological order on Chitter' do
    post_peeps(["Charlottay", "Felipe", "Harry"])
    expect(peepers_names(page)).to eq ["Charlottay", "Felipe", "Harry"]
    DatabaseCleaner.clean
  end
end


def peepers_names(page)
  page.all(:css, ".peep_name").map { |node| node.text }
end
