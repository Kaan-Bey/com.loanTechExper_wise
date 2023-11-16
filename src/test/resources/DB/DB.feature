Feature: US17_Users tablosunda sondan bir önceki harfi e olan usernamelerin mobile numarasını update ediniz
@DB17
  Scenario: User tablosunda Update data testi

    * Database connection is established.
    * Update the "905432121212" of the usernames with the penultimate letter e in the Users table
    * Database connection is closed
