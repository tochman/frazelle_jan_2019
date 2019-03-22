Feature: User Can Logout
	As a User
	In order to exit my account
	I would like to be able to logout

	Background:
		Given the following users exist
			| email           | role       |
			| laura@mail.com  | editor     |
			| alecia@mail.com | registered |
			| amanda@mail.com | journalist |

	Scenario: Logging out as Editor
		Given I am logged in as "laura@mail.com"
		And I visit the "landing" page
		When I click on "Logout"
		Then I should see "Signed out successfully."

	Scenario: Logging out as Journalist
		Given I am logged in as "amanda@mail.com"
		And I visit the "landing" page
		When I click on "Logout"
		Then I should see "Signed out successfully."

	Scenario: Logging out as Registered User
		Given I am logged in as "alecia@mail.com"
		And I visit the "landing" page
		When I click on "Logout"
		Then I should see "Signed out successfully."

	Scenario: Visitor cannot see logout button
		Given I visit the "landing" page
		Then I should not see "Logout"