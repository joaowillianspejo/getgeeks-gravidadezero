*** Settings ***
Documentation   Database Helpers

Library   DatabaseLibrary
Library   factories/Users.py

*** Keywords ***
Connect To Postgres
  Connect To Database   psycopg2
  ...                   wvdocjxb
  ...                   wvdocjxb
  ...                   iyENgDASLyCZc4FGc0nzgp1S-ZHYZ3_a
  ...                   jelani.db.elephantsql.com
  ...                   5432

Reset Env
  Execute SQL String    DELETE from public.geeks;
  Execute SQL String    DELETE from public.users;

Insert User
  [Arguments]   ${user}

  ${hashed_password}    Get Hashed Password   ${user}[password]

  ${query}    Set Variable    INSERT INTO public.users (name, email, password_hash, is_geek) values ('${user}[name] ${user}[lastname]', '${user}[email]', '${hashed_password}', false)

  Execute SQL String    ${query}

Users Seed
  ${user_login}                     Factory User    login
  ${user_geek}                      Factory User    be_geek
  ${user_attempt_be_geek}           Factory User    attempt_be_geek

  Insert User   ${user_login}
  Insert User   ${user_geek}
  Insert User   ${user_attempt_be_geek}