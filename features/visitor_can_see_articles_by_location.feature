Feature: Visitor can see articles by location
	As a user
	In order to read relevant articles close to my location
	I would like to see relevant articles to be based on my location.

	Background:

		Given the following categories exist
			| name   |
			| local  |

		And the following articles exist
			| title                                       | content                                                                                                      | image | status | category | city       |
			| Rain is back in Gothenburg                  | It looks like sunny days are coming to an end. Prepare your umbrella!                                        |       | free   | local    | Gothenburg |
			| Cinnamon Bun Festival starting this weekend | The time for the Cinnamon Bun Festival has come! Lots of tourists in Stockholm, police set on maximum alert! |       | free   | local    | Stockholm  |

	Scenario: Visitor can see articles by location (Gothenburg)
		Given I visit the "landing" page
		And I am in "Gothenburg"
		Then I should see "It looks like sunny days are coming to an end. Prepare your umbrella!" for "Rain is back in Gothenburg"
		And I should not see "The time for the Cinnamon Bun Festival has come! Lots of tourists in Stockholm, police set on maximum alert!" for "Cinnamon Bun Festival starting this weekend"

	Scenario: Visitor can see articles by location (Stockholm)
		Given I visit the "landing" page
		And I am in "Stockholm"
		Then I should see "The time for the Cinnamon Bun Festival has come! Lots of tourists in Stockholm, police set on maximum alert!" for "Cinnamon Bun Festival starting this weekend"
		And I should not see "Prepare your umbrellas" for "Rain is back in Gothenburg"
