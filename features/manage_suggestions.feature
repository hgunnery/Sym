Feature: Suggestions can be created and maintained
  In order to function as a membership platform
  As a users
  I want create and manage suggestions

	Scenario: As an admin I can create suggestions
		Given I have an admin and they are logged in
		When I go to the suggestions page
		And I follow "New Suggestion"
		And I fill in "Name" with "Suggestion 1"
		And I fill in "Description" with "A lot of info on how Suggestion 1 should be made"
		And I press "Create Suggestion"
		Then I should see "Suggestion created"

	Scenario: As a supporter I can create suggestions
		Given I have a supporter and they are logged in
		When I go to the suggestions page
		And I follow "New Suggestion"
		And I fill in "Name" with "Suggestion 1"
		And I fill in "Description" with "A lot of info on how Suggestion 1 should be made"
		And I press "Create Suggestion"
		Then I should see "Suggestion created"

	Scenario: As a supporter I can view only admin crated suggestions
		Given I have a supporter and they are logged in
		And I have a suggestion created by an Admin
		When I go to the suggestions page
		Then I should see the Admin created suggestions name

	Scenario: As an admin I can complete a suggestion and a user can see it as completed
		Given I have an admin and a user and the admin is logged in
		And I have a suggestion created by an Admin
		When I complete that suggestion
		And I follow "Log out"
		And I login as the user
		And I go to the suggestions page
		Then I should see the Admin created suggestions name

	Scenario: As an admin I can ban a suggestion
		Given I have an admin and a user and the admin is logged in
		And I have a suggestion created by an Admin
		When I edit that suggestion
		And I check "Banned"
		And I fill in "Banned reason" with "This is outside of my scope of work"
		And I press "Update Suggestion"
		Then I should see "Suggestion updated"
