Feature: Editor can sign in
	As an Editor
	In order to edit and review articles
	I would like to log-in as an Editor

	Background:
		Given the following users exist
			| email           | role       |
			| laura@mail.com  | editor     |
			| alecia@mail.com | registered |
			| amanda@mail.com | journalist |

	Scenario: Logging in as Editor (access to staff page)
		Given I am logged in as "laura@mail.com"
		And I visit the "landing" page
		When I click on "Employee"
		Then I should see "Welcome to the staff page"

	Scenario: Logging in as Journalist (access to staff page)
		Given I am logged in as "amanda@mail.com"
		And I visit the "landing" page
		When I click on "Employee"
		Then I should see "Welcome to the staff page"

	Scenario: Logging in as User (not access to staff page)
		Given I am logged in as "alecia@mail.com"
		And I visit the "landing" page
		And I should not see "Employee"