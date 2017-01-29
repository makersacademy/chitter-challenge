Inspecting 16 files
..EC............

Offenses:

irb_setup-01.rb:47:4: E: no .<digit> floating literal anymore; put 0 before dot
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
2.3.3 :001 > require_relative 'irb_setup-01'
   ^^
irb_setup-01.rb:47:7: E: unexpected token tCOLON
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
2.3.3 :001 > require_relative 'irb_setup-01'
      ^
irb_setup-01.rb:47:31: E: unexpected token tSTRING
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
2.3.3 :001 > require_relative 'irb_setup-01'
                              ^^^^^^^^^^^^^^
irb_setup-01.rb:48:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000221) SET backslash_quote = off
              ^^^
irb_setup-01.rb:49:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000144) SET standard_conforming_strings = on
              ^^^
irb_setup-01.rb:50:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000115) SET client_min_messages = warning
              ^^^
irb_setup-01.rb:51:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000178) SET datestyle = ISO
              ^^^
irb_setup-01.rb:52:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000413) SELECT current_schema()
              ^^^^^^
irb_setup-01.rb:53:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.002925) SELECT COUNT(*) FROM "information_schema"."tables" WHERE "table_type" = 'BASE TABLE' AND "table_schema" = 'public' AND "table_name" = 'peeps'
              ^^^^^^
irb_setup-01.rb:53:29: E: unexpected token tRPAREN
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.002925) SELECT COUNT(*) FROM "information_schema"."tables" WHERE "table_type" = 'BASE TABLE' AND "table_schema" = 'public' AND "table_name" = 'peeps'
                            ^
irb_setup-01.rb:53:57: E: unexpected token tSTRING
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.002925) SELECT COUNT(*) FROM "information_schema"."tables" WHERE "table_type" = 'BASE TABLE' AND "table_schema" = 'public' AND "table_name" = 'peeps'
                                                        ^^^^^^^^
irb_setup-01.rb:54:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000928) SELECT COUNT(*) FROM "information_schema"."tables" WHERE "table_type" = 'BASE TABLE' AND "table_schema" = 'public' AND "table_name" = 'users'
              ^^^^^^
irb_setup-01.rb:54:29: E: unexpected token tRPAREN
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000928) SELECT COUNT(*) FROM "information_schema"."tables" WHERE "table_type" = 'BASE TABLE' AND "table_schema" = 'public' AND "table_name" = 'users'
                            ^
irb_setup-01.rb:54:57: E: unexpected token tSTRING
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000928) SELECT COUNT(*) FROM "information_schema"."tables" WHERE "table_type" = 'BASE TABLE' AND "table_schema" = 'public' AND "table_name" = 'users'
                                                        ^^^^^^^^
irb_setup-01.rb:55:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000857) SELECT COUNT(*) FROM "information_schema"."tables" WHERE "table_type" = 'BASE TABLE' AND "table_schema" = 'public' AND "table_name" = 'peep_users'
              ^^^^^^
irb_setup-01.rb:55:29: E: unexpected token tRPAREN
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000857) SELECT COUNT(*) FROM "information_schema"."tables" WHERE "table_type" = 'BASE TABLE' AND "table_schema" = 'public' AND "table_name" = 'peep_users'
                            ^
irb_setup-01.rb:55:57: E: unexpected token tSTRING
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000857) SELECT COUNT(*) FROM "information_schema"."tables" WHERE "table_type" = 'BASE TABLE' AND "table_schema" = 'public' AND "table_name" = 'peep_users'
                                                        ^^^^^^^^
irb_setup-01.rb:56:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.001969) SELECT COUNT(*) FROM "information_schema"."table_constraints" WHERE "constraint_type" = 'FOREIGN KEY' AND "table_schema" = 'public' AND "table_name" = 'peep_users' AND "constraint_name" = 'peep_users_user_fk'
              ^^^^^^
irb_setup-01.rb:56:29: E: unexpected token tRPAREN
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.001969) SELECT COUNT(*) FROM "information_schema"."table_constraints" WHERE "constraint_type" = 'FOREIGN KEY' AND "table_schema" = 'public' AND "table_name" = 'peep_users' AND "constraint_name" = 'peep_users_user_fk'
                            ^
irb_setup-01.rb:56:57: E: unexpected token tSTRING
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.001969) SELECT COUNT(*) FROM "information_schema"."table_constraints" WHERE "constraint_type" = 'FOREIGN KEY' AND "table_schema" = 'public' AND "table_name" = 'peep_users' AND "constraint_name" = 'peep_users_user_fk'
                                                        ^^^^^^^^^^^^^^^^^^^
irb_setup-01.rb:57:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.003339) ALTER TABLE "peep_users" DROP CONSTRAINT "peep_users_user_fk"
              ^^^^^
irb_setup-01.rb:57:40: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.003339) ALTER TABLE "peep_users" DROP CONSTRAINT "peep_users_user_fk"
                                       ^^^^
irb_setup-01.rb:58:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.001231) SELECT COUNT(*) FROM "information_schema"."table_constraints" WHERE "constraint_type" = 'FOREIGN KEY' AND "table_schema" = 'public' AND "table_name" = 'peep_users' AND "constraint_name" = 'peep_users_peep_fk'
              ^^^^^^
irb_setup-01.rb:58:29: E: unexpected token tRPAREN
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.001231) SELECT COUNT(*) FROM "information_schema"."table_constraints" WHERE "constraint_type" = 'FOREIGN KEY' AND "table_schema" = 'public' AND "table_name" = 'peep_users' AND "constraint_name" = 'peep_users_peep_fk'
                            ^
irb_setup-01.rb:58:57: E: unexpected token tSTRING
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.001231) SELECT COUNT(*) FROM "information_schema"."table_constraints" WHERE "constraint_type" = 'FOREIGN KEY' AND "table_schema" = 'public' AND "table_name" = 'peep_users' AND "constraint_name" = 'peep_users_peep_fk'
                                                        ^^^^^^^^^^^^^^^^^^^
irb_setup-01.rb:59:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000826) ALTER TABLE "peep_users" DROP CONSTRAINT "peep_users_peep_fk"
              ^^^^^
irb_setup-01.rb:59:40: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000826) ALTER TABLE "peep_users" DROP CONSTRAINT "peep_users_peep_fk"
                                       ^^^^
irb_setup-01.rb:60:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000262) SELECT version()
              ^^^^^^
irb_setup-01.rb:61:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000142) SET client_min_messages = warning
              ^^^
irb_setup-01.rb:62:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.002229) DROP TABLE IF EXISTS "peeps"
              ^^^^
irb_setup-01.rb:63:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000172) RESET client_min_messages
              ^^^^^
irb_setup-01.rb:64:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000173) SET client_min_messages = warning
              ^^^
irb_setup-01.rb:65:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000946) SELECT COUNT(*) FROM "information_schema"."tables" WHERE "table_type" = 'BASE TABLE' AND "table_schema" = 'public' AND "table_name" = 'peeps'
              ^^^^^^
irb_setup-01.rb:65:29: E: unexpected token tRPAREN
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000946) SELECT COUNT(*) FROM "information_schema"."tables" WHERE "table_type" = 'BASE TABLE' AND "table_schema" = 'public' AND "table_name" = 'peeps'
                            ^
irb_setup-01.rb:65:57: E: unexpected token tSTRING
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000946) SELECT COUNT(*) FROM "information_schema"."tables" WHERE "table_type" = 'BASE TABLE' AND "table_schema" = 'public' AND "table_name" = 'peeps'
                                                        ^^^^^^^^
irb_setup-01.rb:66:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.003820) CREATE TABLE "peeps" ("id" SERIAL NOT NULL, "words" VARCHAR(50), "email" VARCHAR(50), PRIMARY KEY("id"))
              ^^^^^^
irb_setup-01.rb:66:36: E: unexpected token tLPAREN2
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.003820) CREATE TABLE "peeps" ("id" SERIAL NOT NULL, "words" VARCHAR(50), "email" VARCHAR(50), PRIMARY KEY("id"))
                                   ^
irb_setup-01.rb:66:67: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.003820) CREATE TABLE "peeps" ("id" SERIAL NOT NULL, "words" VARCHAR(50), "email" VARCHAR(50), PRIMARY KEY("id"))
                                                                  ^^^^^^^
irb_setup-01.rb:66:78: E: unexpected token tCOMMA
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.003820) CREATE TABLE "peeps" ("id" SERIAL NOT NULL, "words" VARCHAR(50), "email" VARCHAR(50), PRIMARY KEY("id"))
                                                                             ^
irb_setup-01.rb:66:99: E: unexpected token tCOMMA
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.003820) CREATE TABLE "peeps" ("id" SERIAL NOT NULL, "words" VARCHAR(50), "email" VARCHAR(50), PRIMARY KEY("id"))
                                                                                                  ^
irb_setup-01.rb:66:118: E: unexpected token tRPAREN
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.003820) CREATE TABLE "peeps" ("id" SERIAL NOT NULL, "words" VARCHAR(50), "email" VARCHAR(50), PRIMARY KEY("id"))
                                                                                                                     ^
irb_setup-01.rb:67:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000280) RESET client_min_messages
              ^^^^^
irb_setup-01.rb:68:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000117) SET client_min_messages = warning
              ^^^
irb_setup-01.rb:69:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.001142) DROP TABLE IF EXISTS "users"
              ^^^^
irb_setup-01.rb:70:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000140) RESET client_min_messages
              ^^^^^
irb_setup-01.rb:71:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000140) SET client_min_messages = warning
              ^^^
irb_setup-01.rb:72:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000821) SELECT COUNT(*) FROM "information_schema"."tables" WHERE "table_type" = 'BASE TABLE' AND "table_schema" = 'public' AND "table_name" = 'users'
              ^^^^^^
irb_setup-01.rb:72:29: E: unexpected token tRPAREN
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000821) SELECT COUNT(*) FROM "information_schema"."tables" WHERE "table_type" = 'BASE TABLE' AND "table_schema" = 'public' AND "table_name" = 'users'
                            ^
irb_setup-01.rb:72:57: E: unexpected token tSTRING
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000821) SELECT COUNT(*) FROM "information_schema"."tables" WHERE "table_type" = 'BASE TABLE' AND "table_schema" = 'public' AND "table_name" = 'users'
                                                        ^^^^^^^^
irb_setup-01.rb:73:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.002726) CREATE TABLE "users" ("id" SERIAL NOT NULL, "email" VARCHAR(50) NOT NULL, "password_digest" TEXT, PRIMARY KEY("id"))
              ^^^^^^
irb_setup-01.rb:73:36: E: unexpected token tLPAREN2
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.002726) CREATE TABLE "users" ("id" SERIAL NOT NULL, "email" VARCHAR(50) NOT NULL, "password_digest" TEXT, PRIMARY KEY("id"))
                                   ^
irb_setup-01.rb:73:67: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.002726) CREATE TABLE "users" ("id" SERIAL NOT NULL, "email" VARCHAR(50) NOT NULL, "password_digest" TEXT, PRIMARY KEY("id"))
                                                                  ^^^^^^^
irb_setup-01.rb:73:79: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.002726) CREATE TABLE "users" ("id" SERIAL NOT NULL, "email" VARCHAR(50) NOT NULL, "password_digest" TEXT, PRIMARY KEY("id"))
                                                                              ^^^
irb_setup-01.rb:73:107: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.002726) CREATE TABLE "users" ("id" SERIAL NOT NULL, "email" VARCHAR(50) NOT NULL, "password_digest" TEXT, PRIMARY KEY("id"))
                                                                                                          ^^^^
irb_setup-01.rb:73:121: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.002726) CREATE TABLE "users" ("id" SERIAL NOT NULL, "email" VARCHAR(50) NOT NULL, "password_digest" TEXT, PRIMARY KEY("id"))
                                                                                                                        ^^^
irb_setup-01.rb:73:130: E: unexpected token tRPAREN
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.002726) CREATE TABLE "users" ("id" SERIAL NOT NULL, "email" VARCHAR(50) NOT NULL, "password_digest" TEXT, PRIMARY KEY("id"))
                                                                                                                                 ^
irb_setup-01.rb:74:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.001048) CREATE UNIQUE INDEX "unique_users_email" ON "users" ("email")
              ^^^^^^
irb_setup-01.rb:74:56: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.001048) CREATE UNIQUE INDEX "unique_users_email" ON "users" ("email")
                                                       ^^
irb_setup-01.rb:75:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000157) RESET client_min_messages
              ^^^^^
irb_setup-01.rb:76:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000154) SET client_min_messages = warning
              ^^^
irb_setup-01.rb:77:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000822) DROP TABLE IF EXISTS "peep_users"
              ^^^^
irb_setup-01.rb:78:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000166) RESET client_min_messages
              ^^^^^
irb_setup-01.rb:79:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000125) SET client_min_messages = warning
              ^^^
irb_setup-01.rb:80:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000903) SELECT COUNT(*) FROM "information_schema"."tables" WHERE "table_type" = 'BASE TABLE' AND "table_schema" = 'public' AND "table_name" = 'peep_users'
              ^^^^^^
irb_setup-01.rb:80:29: E: unexpected token tRPAREN
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000903) SELECT COUNT(*) FROM "information_schema"."tables" WHERE "table_type" = 'BASE TABLE' AND "table_schema" = 'public' AND "table_name" = 'peep_users'
                            ^
irb_setup-01.rb:80:57: E: unexpected token tSTRING
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000903) SELECT COUNT(*) FROM "information_schema"."tables" WHERE "table_type" = 'BASE TABLE' AND "table_schema" = 'public' AND "table_name" = 'peep_users'
                                                        ^^^^^^^^
irb_setup-01.rb:81:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.001330) CREATE TABLE "peep_users" ("peep_id" INTEGER NOT NULL, "user_id" INTEGER NOT NULL, PRIMARY KEY("peep_id", "user_id"))
              ^^^^^^
irb_setup-01.rb:81:41: E: unexpected token tLPAREN2
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.001330) CREATE TABLE "peep_users" ("peep_id" INTEGER NOT NULL, "user_id" INTEGER NOT NULL, PRIMARY KEY("peep_id", "user_id"))
                                        ^
irb_setup-01.rb:81:80: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.001330) CREATE TABLE "peep_users" ("peep_id" INTEGER NOT NULL, "user_id" INTEGER NOT NULL, PRIMARY KEY("peep_id", "user_id"))
                                                                               ^^^^^^^
irb_setup-01.rb:81:106: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.001330) CREATE TABLE "peep_users" ("peep_id" INTEGER NOT NULL, "user_id" INTEGER NOT NULL, PRIMARY KEY("peep_id", "user_id"))
                                                                                                         ^^^
irb_setup-01.rb:81:131: E: unexpected token tRPAREN
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.001330) CREATE TABLE "peep_users" ("peep_id" INTEGER NOT NULL, "user_id" INTEGER NOT NULL, PRIMARY KEY("peep_id", "user_id"))
                                                                                                                                  ^
irb_setup-01.rb:82:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000267) RESET client_min_messages
              ^^^^^
irb_setup-01.rb:83:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.001161) SELECT COUNT(*) FROM "information_schema"."table_constraints" WHERE "constraint_type" = 'FOREIGN KEY' AND "table_schema" = 'public' AND "table_name" = 'peep_users' AND "constraint_name" = 'peep_users_user_fk'
              ^^^^^^
irb_setup-01.rb:83:29: E: unexpected token tRPAREN
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.001161) SELECT COUNT(*) FROM "information_schema"."table_constraints" WHERE "constraint_type" = 'FOREIGN KEY' AND "table_schema" = 'public' AND "table_name" = 'peep_users' AND "constraint_name" = 'peep_users_user_fk'
                            ^
irb_setup-01.rb:83:57: E: unexpected token tSTRING
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.001161) SELECT COUNT(*) FROM "information_schema"."table_constraints" WHERE "constraint_type" = 'FOREIGN KEY' AND "table_schema" = 'public' AND "table_name" = 'peep_users' AND "constraint_name" = 'peep_users_user_fk'
                                                        ^^^^^^^^^^^^^^^^^^^
irb_setup-01.rb:84:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.002251) ALTER TABLE "peep_users" ADD CONSTRAINT "peep_users_user_fk" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
              ^^^^^
irb_setup-01.rb:84:40: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.002251) ALTER TABLE "peep_users" ADD CONSTRAINT "peep_users_user_fk" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
                                       ^^^
irb_setup-01.rb:84:76: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.002251) ALTER TABLE "peep_users" ADD CONSTRAINT "peep_users_user_fk" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
                                                                           ^^^^^^^
irb_setup-01.rb:84:100: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.002251) ALTER TABLE "peep_users" ADD CONSTRAINT "peep_users_user_fk" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
                                                                                                   ^^^^^^^^^^
irb_setup-01.rb:85:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.001108) SELECT COUNT(*) FROM "information_schema"."table_constraints" WHERE "constraint_type" = 'FOREIGN KEY' AND "table_schema" = 'public' AND "table_name" = 'peep_users' AND "constraint_name" = 'peep_users_peep_fk'
              ^^^^^^
irb_setup-01.rb:85:29: E: unexpected token tRPAREN
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.001108) SELECT COUNT(*) FROM "information_schema"."table_constraints" WHERE "constraint_type" = 'FOREIGN KEY' AND "table_schema" = 'public' AND "table_name" = 'peep_users' AND "constraint_name" = 'peep_users_peep_fk'
                            ^
irb_setup-01.rb:85:57: E: unexpected token tSTRING
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.001108) SELECT COUNT(*) FROM "information_schema"."table_constraints" WHERE "constraint_type" = 'FOREIGN KEY' AND "table_schema" = 'public' AND "table_name" = 'peep_users' AND "constraint_name" = 'peep_users_peep_fk'
                                                        ^^^^^^^^^^^^^^^^^^^
irb_setup-01.rb:86:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.001120) ALTER TABLE "peep_users" ADD CONSTRAINT "peep_users_peep_fk" FOREIGN KEY ("peep_id") REFERENCES "peeps" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
              ^^^^^
irb_setup-01.rb:86:40: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.001120) ALTER TABLE "peep_users" ADD CONSTRAINT "peep_users_peep_fk" FOREIGN KEY ("peep_id") REFERENCES "peeps" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
                                       ^^^
irb_setup-01.rb:86:76: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.001120) ALTER TABLE "peep_users" ADD CONSTRAINT "peep_users_peep_fk" FOREIGN KEY ("peep_id") REFERENCES "peeps" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
                                                                           ^^^^^^^
irb_setup-01.rb:86:100: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.001120) ALTER TABLE "peep_users" ADD CONSTRAINT "peep_users_peep_fk" FOREIGN KEY ("peep_id") REFERENCES "peeps" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
                                                                                                   ^^^^^^^^^^
irb_setup-01.rb:87:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000663) SELECT "id" FROM "users" WHERE "email" = 'eric@example.com' ORDER BY "id" LIMIT 1
              ^^^^^^
irb_setup-01.rb:87:89: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000663) SELECT "id" FROM "users" WHERE "email" = 'eric@example.com' ORDER BY "id" LIMIT 1
                                                                                        ^^^^^
irb_setup-01.rb:88:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000639) INSERT INTO "users" ("email", "password_digest") VALUES ('eric@example.com', '$2a$10$sbKoQP4KR5mWXeQ536brdu3jT5FOqhMOK3Oc7c3JwN0Pzz2lZq8QG') RETURNING "id"
              ^^^^^^
irb_setup-01.rb:88:35: E: unexpected token tLPAREN2
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000639) INSERT INTO "users" ("email", "password_digest") VALUES ('eric@example.com', '$2a$10$sbKoQP4KR5mWXeQ536brdu3jT5FOqhMOK3Oc7c3JwN0Pzz2lZq8QG') RETURNING "id"
                                  ^
irb_setup-01.rb:88:90: E: unexpected token tCOMMA
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000639) INSERT INTO "users" ("email", "password_digest") VALUES ('eric@example.com', '$2a$10$sbKoQP4KR5mWXeQ536brdu3jT5FOqhMOK3Oc7c3JwN0Pzz2lZq8QG') RETURNING "id"
                                                                                         ^
irb_setup-01.rb:89:15: E: unexpected token tCONSTANT
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000702) INSERT INTO "peeps" ("words", "email") VALUES ('have a banana', 'eric@example.com') RETURNING "id"
              ^^^^^^
irb_setup-01.rb:89:35: E: unexpected token tLPAREN2
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000702) INSERT INTO "peeps" ("words", "email") VALUES ('have a banana', 'eric@example.com') RETURNING "id"
                                  ^
irb_setup-01.rb:89:77: E: unexpected token tCOMMA
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 ~ (0.000702) INSERT INTO "peeps" ("words", "email") VALUES ('have a banana', 'eric@example.com') RETURNING "id"
                                                                            ^
irb_setup-01.rb:90:2: E: unexpected token tASSOC
(Using Ruby 2.1 parser; configure using TargetRubyVersion parameter, under AllCops)
 => true
 ^^
irb_setup.rb:9:17: C: Style/HashSyntax: Use the new Ruby 1.9 hash syntax. (https://github.com/bbatsov/ruby-style-guide#hash-literals)
  has 1, :user, :through => Resource, :child_key => 'email'
                ^^^^^^^^^^^
irb_setup.rb:9:39: C: Style/HashSyntax: Use the new Ruby 1.9 hash syntax. (https://github.com/bbatsov/ruby-style-guide#hash-literals)
  has 1, :user, :through => Resource, :child_key => 'email'
                                      ^^^^^^^^^^^^^
irb_setup.rb:21:18: C: Style/HashSyntax: Use the new Ruby 1.9 hash syntax. (https://github.com/bbatsov/ruby-style-guide#hash-literals)
  has n, :peeps, :through => Resource
                 ^^^^^^^^^^^
irb_setup.rb:49:91: C: Metrics/LineLength: Line is too long. [157/90] (https://github.com/bbatsov/ruby-style-guide#80-character-limits)
#  ~ (0.003319) SELECT COUNT(*) FROM "information_schema"."tables" WHERE "table_type" = 'BASE TABLE' AND "table_schema" = 'public' AND "table_name" = 'peeps'
                                                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
irb_setup.rb:50:91: C: Metrics/LineLength: Line is too long. [157/90] (https://github.com/bbatsov/ruby-style-guide#80-character-limits)
#  ~ (0.000815) SELECT COUNT(*) FROM "information_schema"."tables" WHERE "table_type" = 'BASE TABLE' AND "table_schema" = 'public' AND "table_name" = 'users'
                                                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
irb_setup.rb:51:91: C: Metrics/LineLength: Line is too long. [162/90] (https://github.com/bbatsov/ruby-style-guide#80-character-limits)
#  ~ (0.000961) SELECT COUNT(*) FROM "information_schema"."tables" WHERE "table_type" = 'BASE TABLE' AND "table_schema" = 'public' AND "table_name" = 'peep_users'
                                                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
irb_setup.rb:57:91: C: Metrics/LineLength: Line is too long. [157/90] (https://github.com/bbatsov/ruby-style-guide#80-character-limits)
#  ~ (0.000958) SELECT COUNT(*) FROM "information_schema"."tables" WHERE "table_type" = 'BASE TABLE' AND "table_schema" = 'public' AND "table_name" = 'peeps'
                                                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
irb_setup.rb:58:91: C: Metrics/LineLength: Line is too long. [120/90] (https://github.com/bbatsov/ruby-style-guide#80-character-limits)
#  ~ (0.027120) CREATE TABLE "peeps" ("id" SERIAL NOT NULL, "words" VARCHAR(50), "email" VARCHAR(50), PRIMARY KEY("id"))
                                                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
irb_setup.rb:64:91: C: Metrics/LineLength: Line is too long. [157/90] (https://github.com/bbatsov/ruby-style-guide#80-character-limits)
#  ~ (0.000886) SELECT COUNT(*) FROM "information_schema"."tables" WHERE "table_type" = 'BASE TABLE' AND "table_schema" = 'public' AND "table_name" = 'users'
                                                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
irb_setup.rb:65:91: C: Metrics/LineLength: Line is too long. [113/90] (https://github.com/bbatsov/ruby-style-guide#80-character-limits)
#  ~ (0.003423) CREATE TABLE "users" ("email" VARCHAR(50) NOT NULL, "password_digest" TEXT, PRIMARY KEY("email"))
                                                                                          ^^^^^^^^^^^^^^^^^^^^^^^
irb_setup.rb:71:91: C: Metrics/LineLength: Line is too long. [162/90] (https://github.com/bbatsov/ruby-style-guide#80-character-limits)
#  ~ (0.001075) SELECT COUNT(*) FROM "information_schema"."tables" WHERE "table_type" = 'BASE TABLE' AND "table_schema" = 'public' AND "table_name" = 'peep_users'
                                                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
irb_setup.rb:72:91: C: Metrics/LineLength: Line is too long. [143/90] (https://github.com/bbatsov/ruby-style-guide#80-character-limits)
#  ~ (0.001407) CREATE TABLE "peep_users" ("peep_id" INTEGER NOT NULL, "user_email" VARCHAR(50) NOT NULL, PRIMARY KEY("peep_id", "user_email"))
                                                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
irb_setup.rb:74:91: C: Metrics/LineLength: Line is too long. [224/90] (https://github.com/bbatsov/ruby-style-guide#80-character-limits)
#  ~ (0.002634) SELECT COUNT(*) FROM "information_schema"."table_constraints" WHERE "constraint_type" = 'FOREIGN KEY' AND "table_schema" = 'public' AND "table_name" = 'peep_users' AND "constraint_name" = 'peep_users_user_fk'
                                                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
irb_setup.rb:75:91: C: Metrics/LineLength: Line is too long. [172/90] (https://github.com/bbatsov/ruby-style-guide#80-character-limits)
#  ~ (0.009790) ALTER TABLE "peep_users" ADD CONSTRAINT "peep_users_user_fk" FOREIGN KEY ("user_email") REFERENCES "users" ("email") ON DELETE NO ACTION ON UPDATE NO ACTION
                                                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
irb_setup.rb:76:91: C: Metrics/LineLength: Line is too long. [224/90] (https://github.com/bbatsov/ruby-style-guide#80-character-limits)
#  ~ (0.001135) SELECT COUNT(*) FROM "information_schema"."table_constraints" WHERE "constraint_type" = 'FOREIGN KEY' AND "table_schema" = 'public' AND "table_name" = 'peep_users' AND "constraint_name" = 'peep_users_peep_fk'
                                                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
irb_setup.rb:77:91: C: Metrics/LineLength: Line is too long. [166/90] (https://github.com/bbatsov/ruby-style-guide#80-character-limits)
#  ~ (0.001648) ALTER TABLE "peep_users" ADD CONSTRAINT "peep_users_peep_fk" FOREIGN KEY ("peep_id") REFERENCES "peeps" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
                                                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
irb_setup.rb:78:91: C: Metrics/LineLength: Line is too long. [103/90] (https://github.com/bbatsov/ruby-style-guide#80-character-limits)
#  ~ (0.000547) SELECT "email" FROM "users" WHERE "email" = 'eric@example.com' ORDER BY "email" LIMIT 1
                                                                                          ^^^^^^^^^^^^^
irb_setup.rb:79:91: C: Metrics/LineLength: Line is too long. [156/90] (https://github.com/bbatsov/ruby-style-guide#80-character-limits)
#  ~ (0.000593) INSERT INTO "users" ("email", "password_digest") VALUES ('eric@example.com', '$2a$10$NnvchjeQOuYfudjMsfpMquIGp/jooSoGxPhTBL9aze1GvV30vgTEm')
                                                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
irb_setup.rb:80:91: C: Metrics/LineLength: Line is too long. [114/90] (https://github.com/bbatsov/ruby-style-guide#80-character-limits)
#  ~ (0.000639) INSERT INTO "peeps" ("words", "email") VALUES ('have a banana', 'eric@example.com') RETURNING "id"
                                                                                          ^^^^^^^^^^^^^^^^^^^^^^^^

16 files inspected, 114 offenses detected
