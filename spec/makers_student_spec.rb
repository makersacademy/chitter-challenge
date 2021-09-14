require 'makers_students'

describe '.all' do    
    it 'returns a list of students' do
        connection = PG.connect(dbname: 'chitter_machine_test', user: 'postgres', password: 'password')

        connection.exec("INSERT INTO students (email,student_name,username,password,created_on) VALUES ('samp_email@gmail.com','David','davo','123456','14/09/2021 15:16');")
        connection.exec("INSERT INTO students (email,student_name,username,password,created_on) VALUES ('sa_email@gmail.com','Sam','Sambo','123456','14/09/2021 15:16');")
        connection.exec("INSERT INTO students (email,student_name,username,password,created_on) VALUES ('samp_ema@gmail.com','John','johnny','123456','14/09/2021 15:16');")
        connection.exec("INSERT INTO students (email,student_name,username,password,created_on) VALUES ('samail@gmail.com','Richmond','richo','123456','14/09/2021 15:16');")
        
        student = Student.all

        expect(student).to include "davo"
        expect(student).to include "Sambo"
        expect(student).to include "johnny"
        expect(student).to include "richo"
    end
end