Feature: Users can register and manage account
  In order to function as a membership platform
  As a supporter
  I want to go register and manage my account

	Scenario: Supporter can Register
		Given I have the supporter pre-requisites
		When I go to the homepage
		And I follow "Sign up"
		And I fill in "user_first_name" with "John"
		And I fill in "user_last_name" with "Smith"
		And I fill in "user_email" with "john.smith@test.com"
		And I select "Bronze" from "user_supporter_level_id"
		And I fill in "user_password" with "password"
		And I fill in "user_password_confirmation" with "password"
		And I press "Register"
		Then I should see "Congratulations you are all set!"

	Scenario: Supporter can log in and edit their details
		Given I have a supporter and pre-requisites
		When I go to the homepage
		And I log in as a support
		And I follow "Update your details"
		And I fill in "user_last_name" with "Smithy"
		And I press "Update"
		Then I should see "Details updated"
