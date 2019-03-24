Feature: Visitor cannot read restricted articles
	As an Owner
	In order to gain subscribers
	I want to be able to restrict certain content.

	Background:
		Given the following users exist
			| email        | password |
			| laura@ca.com | password |

		And the following articles exist
			| title                                  | content                                                     | image                                                                 | status     | category |
			| The Hub News is the site of the moment | Great articles! This site's popularity is raising so quick! | https://cdn.pixabay.com/photo/2016/11/29/04/19/beach-1867285__340.jpg | free       | tech     |
			| Spring hasn't arrived in Sweden yet    | Ice can be still spotted on the street, watch out!          | https://cdn.pixabay.com/photo/2016/11/29/04/19/beach-1867285__340.jpg | restricted | sports   |

	Scenario: Visitor can read a free article [Happy Path]
		Given I visit the "landing" page
		When I click on "The Hub News is the site of the moment"
		Then I should see "Great articles! This site's popularity is raising so quick!"
		And I should see an article image
		But I should not see "Ice can be still spotted on the street, watch out!"

	Scenario: Visitor cannot read a resctricted article [Sad Path]
		Given I visit the "landing" page
		When I click on "Spring hasn't arrived in Sweden yet"
		Then I should be on subscription page
		And I should not see "Ice can be still spotted on the street, watch out!"

	Scenario: Logged in user can see restricted articles
		Given I am logged in as "laura@ca.com"
		When I visit the "landing" page
		And I click on "Spring hasn't arrived in Sweden yet"
		Then I should see "Ice can be still spotted on the street, watch out!"
		And I should see an article image