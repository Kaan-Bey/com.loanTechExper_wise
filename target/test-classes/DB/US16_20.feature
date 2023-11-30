Feature: US17_Users tablosunda sondan bir önceki harfi e olan usernamelerin mobile numarasını update ediniz

  Background:Database connection
    * Database connection is established.

  @DB16
  Scenario: In the "user_logins" table, separate "user id and user ip" by cities.
    * User_logins_Query prapered and executed
    * Verify separate "user id and user ip" by cities

  @DB17
  Scenario: User tablosunda Update data testi
    * Update the "905432121212" of the usernames with the penultimate letter e in the Users table
    * Database connection is closed
