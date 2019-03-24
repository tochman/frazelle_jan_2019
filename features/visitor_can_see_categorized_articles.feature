Feature: Visitor can see categorized articles
	As a Visitor
	In order to find relevant articles
	I would like for the articles to be categorized.

	Background:
		Given the following categories exist
			| name          |
			| sports        |
			| tech          |
			| local         |
			| entertainment |
			| global        |
			| politics      |
			
		And the following articles exist
			| title                                  | content                                                     | image                                                                 | category |
			| The Hub News is the site of the moment | Great articles! This site's popularity is raising so quick! | https://cdn.pixabay.com/photo/2016/11/29/04/19/beach-1867285__340.jpg | sports   |
			| Spring hasn't arrived in Sweden yet    | Ice can be still spotted on the street, watch out!          | https://cdn.pixabay.com/photo/2016/11/29/04/19/beach-1867285__340.jpg | tech     |

	Scenario: Visitor can see category links
		Given I visit the "landing" page
		Then I should see "Local"
		And I should see "Sports"
		And I should see "Global"
		And I should see "Tech"
		And I should see "Entertainment"
		And I should see "Politics"
		And I should see "The Hub News is the site of the moment" in "sports"
		And I should see "Spring hasn't arrived in Sweden yet" in "tech"