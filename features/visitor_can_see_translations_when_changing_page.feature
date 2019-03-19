Feature: Visitor can see translations when changing page
	As a visitor
	In order to improve my user experience
	I would like to have consistency in the language settings

	Background:
		Given the following categories exist
			| name          |
			| sports        |
			| tech          |
			| local         |
			| entertainment |
			| global        |
			| politics      |
		And I visit the "landing" page

  Scenario: Visitor can see translations when changing page [Swedish]
		When I click on "Svenska"
		Then I should see "Köp en prenumeration"
		And I should see "Lokala"
		And I should see "Världen"
		And I should see "Sport"
		And I should see "Nöje"
		And I should see "Politik"
		And I should see "Teknik"
		When I 

	Scenario: Visitor can see translations when changing page [English]
		When I click on "English"
		Then I should see "Become a subscriber"
		And I should see "Local"
		And I should see "Global"
		And I should see "Sports"
		And I should see "Entertainment"
		And I should see "Politics"
		And I should see "Tech"