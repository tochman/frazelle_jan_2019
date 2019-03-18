@javascript
Feature: Visitor can become a Registered User and a Subscriber at once
	As a Visitor
	In order to get access to the best articles
	I would like to be able to become a Subscriber

	Background:
		Given the following articles exist
			| title                                  | category |
			| The Hub News is the site of the moment | tech     |
			| Spring hasn't arrived in Sweden yet    | sports   |

	Scenario: View list of articles on the landing page
		Given I visit the application
		And I click on "Subscribe"
		And I fill in "Name on card" with "Thomas Ochman"
		And I fill in "Email" with "thomas@craft.com"
		And I fill in "Cardnumber" with "4242424242424242" in the Stripe input field
		And I fill in "Expiry date" with "12/22" in the Stripe input field
		And I fill in "CVC" with "123" in the Stripe input field
		When I click on "Pay for Subscription"
		And I wait 10 seconds
		Then I should see "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account."
		And I wait 2 seconds
		And "thomas@craft.com" should receive 1 email
		When I open the email
		Then I should see "Welcome to The Hub News thomas@craft.com!" in the email body
		And I should see my temporary password in the email body
		When "thomas@craft.com" follow "Confirm my account" in the email
		And I should be a subscriber
		Then I should see "You have to change your password"
		When I fill in "Password" with "new_password"
		And I fill in "Password confirmation" with "new_password"
		And I fill in "Current password" with my temp password
		When I click on "Update"
		Then I should see "Your account has been updated successfully."