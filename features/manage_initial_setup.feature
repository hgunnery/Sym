Feature: Manage initial setup
  In order to function as a membership platforms
  As an admin
  I want to manage users

  Scenario: Fresh install works
    When I go to the homepage
    Then I should see "Welcome to your new App"

  Scenario: Register as admin
    Given I have user types
    When I go to the homepage
    And I fill in "user_first_name" with "John"
    And I fill in "user_last_name" with "Shepard"
    And I fill in "user_email" with "john.shepard@metril.com"
    And I fill in "user_password" with "johnwins"
    And I fill in "user_password_confirmation" with "johnwins"
    And I press "Register"
    Then I should see "Congratulations you are all set!"

  Scenario: Home page on app with only an admin user
    And I have only an Admin
    When I go to the homepage
    Then I should see "Welcome to your Sym Membership app, please login"

  Scenario: Logged in Admin Home page with only an admin user - no setup done
    Given I have only an admin and they are logged in
    When I go to the admin homepage
    Then I should see "Lets get setup"
