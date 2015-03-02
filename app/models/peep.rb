class Peep

include DataMapper::Resource

property :id, Serial
property :content, Text
property :author, Text
property :created_at, DateTime

def display_date_and_time
  text = self.created_at.to_s
  months = { "01" => "Jan", "02" => "Feb", "03" => "March", "04" => "April", "05" => "May", "06" => "June", "07" => "July", "08" => "Aug", "09" => "Sept", "10" => "Oct", "11" => "Nov", "12" => "Dec"}
  month = months[text[5..6]]
  display = "#{month} #{text[8,2]} : #{text[11,5]}"
end

end