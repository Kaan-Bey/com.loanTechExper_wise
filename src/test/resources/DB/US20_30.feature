Feature: US21_30

  Background:Database connection
    * Database connection is established.

  @DB21
  Scenario: Verify the number of users with "is_read=1" and "user_id = 1" in the "admin_notifications" table.
    * admin_notifications_table Query is prepared and executed
    * User result values are validated
    * Database connection is closed

  @DB22
  Scenario: admin_password_resets tablosunda status=0 olan Kullanıcının Şifre Sıfırlama İsteğini "email" bilgisini girerek Update ediniz.
    * admin_password_resets_Query is prepared and executed.
    * e_mail is prepared for admin_password_resets query and status is updated.
    * Data Results are validate.
    * Database connection is closed
    @DB23
    Scenario: Belirli Bir "created_at" aralığındaki "status=1" olan Depozitleri Toplam Tutarları ile Birlikte listeleyiniz
      * depositsTable is prepared and executed.
      * Deposits result values are validated
      * Database connection is closed
      @DB24
      Scenario: "user_id=3" olan kullanıcıların "is_read=0" olan bildirimlerini '1' Olarak Update edip doğrulayınız.
        * UpdateQuery is prepared
        * Data Results are obtained.
        * Database connection is closed