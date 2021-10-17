feature "Viewing a list of peeps" do
  new_time = Time.new(2021, 10, 16, 0, 0)

  around { |block| Timecop.freeze(new_time, &block) }

  scenario "viewing peeps in reverse chronological order" do
    Peep.create(text: "First peep!")
    Peep.create(text: "Second peep!", created_at: "#{new_time + 1}")
    Peep.create(text: "Third peep!", created_at: "#{new_time + 2}")
    visit("/chitter")

    expect(page).to have_content "Third peep! created at: #{new_time + 2} Second peep! created at: #{new_time + 1} First peep! created at: #{new_time}"
    expect(page).not_to have_content "First peep! created at: #{new_time} Second peep! created at: #{new_time} Third peep! created at: #{new_time}"
  end

  scenario "peeps have timestamps" do
    Peep.create(text: "First peep!")
    visit("/chitter")
    expect(page).to have_content "First peep! created at: #{new_time}"
  end
end
