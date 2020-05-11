require 'pg'

class Diary

    attr_reader :id, :title, :body, :writing_date

    def initialize(id:, title:, body:, writing_date:)
      @id = id
      @title = title
      @body = body
      @writing_date = writing_date
    end

    def self.all
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'diary_manager_test')
      else
        connection = PG.connect(dbname: 'diary_manager')
      end
      result = connection.exec('SELECT * FROM diary')
      result.map do |diary| 
      Diary.new(id: diary['id'], title: diary['title'], body: diary['body'], writing_date: diary['writing_date'])
      end
    end

    def self.add(title:, body: )
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'diary_manager_test')
      else
        connection = PG.connect(dbname: 'diary_manager')
      end
      result = connection.exec("INSERT INTO diary (title, body) VALUES('#{title}', '#{body}') RETURNING id, title, body, writing_date;")
      Diary.new(id: result[0]['id'], title: result[0]['title'], body: result[0]['body'], writing_date: result[0]['writing_date'] )
    end

end