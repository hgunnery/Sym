Feature: Manage Admin Functionality
  In order to function as a membership platform
  As an admin
  I want to be able to manage my app an dmembership features

  Scenario: Log in to admin dashboard
    Given I have an Admin
    When I log in
    Then I should see "This is the admin homepage"

  Scenario: Admin can see supporter levels
    Given I have an admin and they are logged in
    When I go to the admin homepage
    Then I should see "Current Supporter Levels"

  Scenario: Admin can create supporter level
    Given I have an admin and they are logged in
    When I go to the admin homepage
    And I follow "New Supporter Level"
    And I fill in "supporter_level_name" with "Bronze"
    And I fill in "supporter_level_amount" with "5.00"
		And I fill in "supporter_level_description" with "My awesome supporter level"
    And I press "Create Supporter level"
    Then I should see "Supporter level was successfully created."

  Scenario: Admins can see all current supporter levels on dashboard
    Given I have an admin and they are logged in
    And I have supporter levels called Bronze, Silver and Gold
    When I go to the admin homepage
    Then I should see "Bronze"
    And I should see "Silver"
    And I should see "Gold"
