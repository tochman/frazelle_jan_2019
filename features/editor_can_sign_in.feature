Feature: Editor can sign in
	As an Editor
	In order to edit and review articles
	I would like to log-in as an Editor

	Background:
		Given the following users exist
			| email           | role       |
			| alecia@mail.com | editor     |
			| laura@mail.com  | journalist |

	Scenario: Logging in as Editor (access to editor page)
		Given I am logged in as "alecia@mail.com"
		And I visit the "landing" page
		When I click on "Employee"
		Then I should see "Welcome to the Editor page"

	Scenario: Logging in as Journalist (access to journalist page)
		Given I am logged in as "laura@mail.com"
		And I visit the "landing" page
		When I click on "Employee"
		Then I should see "Welcome to the Journalist page"