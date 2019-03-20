Feature: Journalist can sign in
	As a Journalist
	In order to create and edit my articles
	I would like to log in as a Journalist

	Background:
		Given the following users exist
			| email           | role    				  |
			| amanda@mail.com | journalist				|
			| viktor@mail.com |    subscriber	    |

	Scenario: Logging in as Journalist (access to staff page)
		Given I am logged in as "amanda@mail.com"
		And I visit the "landing" page
		And I click on "Employee"
		Then I should see "Welcome to the staff page"

	Scenario: Logging in as User (not access to staff page)
		Given I am logged in as "viktor@mail.com"
		And I visit the "landing" page
		Then I should not see "Employee"