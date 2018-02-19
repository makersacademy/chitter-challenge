class Peep

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |line|
      p line['peep']
    end
  end

#   def self.create(options)
#   return false unless is_url?(options[:url])
#   result = DatabaseConnection.query("INSERT INTO links (url, title) VALUES('#{options[:url]}', '#{options[:title]}') RETURNING id, url, title")
#   Link.new(result[0]['id'], result[0]['url'], result[0]['title'])
# end
end
