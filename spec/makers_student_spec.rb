require 'makers_students'

describe '#makers_students' do
    
    it '.all' do
        connection = PG.connect(dbname: 'chitter_machine_test', user: 'postgres', password: 'password')
        connection.exec("INSERT INTO students (email, username, student_name, password) VALUES ('samp_emails@gmail.com','davil','David','123456');")
        connection.exec("INSERT INTO students (email, username, student_name, password) VALUES ('sa_email@gmail.com','Sambo','Sam','123456');")

        student = Student.all
        expect(student).to include "davil"
        expect(student).to include "Sambo"
    end

    it '.create' do
        connection = PG.connect(dbname: 'chitter_machine_test', user: 'postgres', password: 'password')
        connection.exec("INSERT INTO students (email, username, student_name, password) VALUES ('samdp_emlail@gmail.com','davilo','David','123456');")
        ###I dont know what the best test is for getting a user_id back from a database query?
        is_expected.not_to be_empty
    end

    it '.get_student_id' do
        connection = PG.connect(dbname: 'chitter_machine_test', user: 'postgres', password: 'password')
        connection.exec("INSERT INTO students (email, username, student_name, password) VALUES ('sdfamp_emlail@gmail.com','dasvil','David','123456');")
        ###I dont know what the best test is for getting a user_id back from a database query?
        is_expected.not_to be_empty
    end
end