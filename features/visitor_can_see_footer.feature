Feature: Visitor can see a footer
	As a Visitor
	In order to see company contact information
	I would like to be able to see a footer

	Scenario:
		Given I visit the "landing" page
		Then I should see "Phone"
		And I should see "Email"
		And I should see "Find Us Here"