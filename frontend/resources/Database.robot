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
  ${users}    Users To Insert DB

  FOR   ${user}   IN    @{users}
    Insert User   ${user}
  END