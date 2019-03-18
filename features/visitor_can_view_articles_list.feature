Feature: Visitor can view all listed articles
	As a Visitor
	In order to choose an article to read
	I would like to be able to see the articles listed on a page

	Background:
		Given the following categories exist
			| name   |
			| tech   |
			| local  |
			| sports |
		And the following articles exist
			| title                                          | content                                                                                                                                                                                     | image | status     | category |
			| The Hub News is the site of the moment         | Great articles! This site's popularity is raising so quick!                                                                                                                                 |       | free       | tech     |
			| Spring hasn't arrived in Sweden yet            | Ice can be still spotted on the street, watch out!                                                                                                                                          |       | restricted | local    |
			| Eating cinnamon buns increases life expectancy | Researchers are running clinical studies to see the benefits of cinnamon buns consumption. Some state that it might be correlated with an increase in life expectancy, is that really true? |       | free       | sports   |

	Scenario: View list of articles on the landing page
		Given I visit the "landing" page
		Then I should see "Great articles! This site's popularity is raising so quick!" for "The Hub News is the site of the moment"
		And I should see "Researchers are running clinical studies to see the benefits of cinnamon buns consumption. Some..." for "Eating cinnamon buns increases life expectancy"
		But I should not see "state that it might be correlated with an increase in life expectancy, is that really true?" for "Eating cinnamon buns increases life expectancy"
		And I should not see "Great articles! This site's popularity is raising so quick!" for "Spring hasn't arrived in Sweden yet"