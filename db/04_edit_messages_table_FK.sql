ALTER TABLE messages 
ADD CONSTRAINT FK_Messages_Users
    FOREIGN KEY (userid) REFERENCES Users(ID);
    