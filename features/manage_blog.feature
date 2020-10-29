Feature: Manage blog
  In order update supporters
  As an admin
  I want to create blog posts

	Scenario: Admins can create and publish blog posts
		Given I have an admin and a user and the admin is logged in
		When I go to the admin posts page
		And I follow "New Post"
		And I fill in "Title" with "Blog Title"
		And I fill in "Content" with "Blog post content"
		And I press "Create Post"
		Then I should see "Post was successfully created."
		When I follow "Publish"
		Then I should see "Post has been published"
		When I log out and log in as a supporter
		And I go to the blog page
		Then I should see "Blog Title"
		When I log out and log in as an admin
		And I go to the admin posts page
		And I follow "Un-Publish"
		Then I should see "Publish"
		When I log out and log in as a supporter
		And I go to the blog page
		Then I should not see "Blog Title"
