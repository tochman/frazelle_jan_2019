Feature: Journalist can create an article

	As a journalist,
	In order to write articles
	I would like to be able to have an article creation form

	Background:
		Given the following categories exist
			| name          |
			| sports        |
			| tech          |
			| local         |
			| entertainment |
			| global        |
			| politics      |
		Given the following users exist
			| email           | role    		 	  |
			| amanda@mail.com | journalist			|
			| viktor@mail.com | registered	    |
		Given I am logged in as "amanda@mail.com"
		And I visit the "landing" page

	Scenario: Journalist can create an article
		When I click on "Employee"
		Then I should see "Welcome to the staff page"
		And I fill in "title" with "Title goes here"
		And I fill in "content" with "Content goes here"
		And I select "Free" from "status-select"
		And I select "Sports" from "categories-select"
		And I click "Save Article"
		Then I should see "Article was successfully created."

	Scenario: Journalist cant create and artcile [SadPath]
		When I click on "Employee"
		Then I should see "Welcome to the staff page"
		And I fill in "title" with "Title goes here"
		And I fill in "content" with ""
		And I select "Free" from "status-select"
		And I select "Sports" from "categories-select"
		And I click "Save Article"
		Then I should see "You have to fill out all the fields."
