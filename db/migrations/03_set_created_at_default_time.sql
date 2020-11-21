# sets default_peep_creation_time
ALTER TABLE peeps ADD CONSTRAINT df_current_time DEFAULT FORMAT(GETDATE(), 'hh:mm:ss') FOR created_at;
