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

	Scenario: Logging in as Editor
		Given I am logged in as "laura@mail.com"
		And I visit the "landing" page
		Then I should see "Logout"
		When I click on "Logout"
		Then I should see "Signed out successfully."

	Scenario: Logging in as Journalist
		Given I am logged in as "amanda@mail.com"
		And I visit the "landing" page
		Then I should see "Logout"
		When I click on "Logout"
		Then I should see "Signed out successfully."

	Scenario: Logging in as Registered User
		Given I am logged in as "alecia@mail.com"
		And I visit the "landing" page
		Then I should see "Logout"
		When I click on "Logout"
		Then I should see "Signed out successfully."


