
Feature: Visitor can become a Registered User and a Subscriber at once
	As a Visitor
	In order to get access to the best articles
	I would like to be able to become a Subscriber

	Background:
		Given the following articles exist
			| title                                  | content                                                     | category | status     |
			| The Hub News is the site of the moment | Great articles! This site's popularity is raising so quick! | tech     | free       |
			| Spring hasn't arrived in Sweden yet    | Ice can be still spotted on the street, watch out!          | sports   | restricted |
	@javascript @stripe
	Scenario: Visitor can successfully become a subscriber [happy path]
		Given I visit the application
		When I click on "Spring hasn't arrived in Sweden yet"
		Then I should be on subscription page
		And I fill in "name_on_card" with "Thomas Ochman"
		And I fill in "Email" with "thomas@craft.com"
		And I fill in "Cardnumber" with "4242424242424242" in the Stripe input field
		And I fill in "Expiry date" with "12/22" in the Stripe input field
		And I fill in "CVC" with "123" in the Stripe input field
		And I click on "Pay for Subscription"
		And I wait 4 seconds
		Then I should see "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account."
		And I wait 2 seconds
		And "thomas@craft.com" should receive 1 email
		When I open the email
		Then I should see "Welcome to The Hub News thomas@craft.com!" in the email body
		And I should see my temporary password in the email body
		When "thomas@craft.com" follow "Confirm my account" in the email
		Then I should be a subscriber
		And I should see "You have to change your password"
		When I fill in "Password" with "new_password"
		And I fill in "Password confirmation" with "new_password"
		And I fill in "Current password" with my temp password
		And I click on "Update"
		Then I should see "Your account has been updated successfully."
		When I visit the "landing" page
		And I click on "Spring hasn't arrived in Sweden yet"
		Then I should see "Ice can be still spotted on the street, watch out!"

	@javascript @stripe
	Scenario: Visitor cannot become a subscriber if enters wrong credentials [sad path]
		Given I visit the application
		And I click on "Subscribe"
		And I fill in "name_on_card" with "Thomas Ochman"
		And I fill in "Email" with " "
		And I wait 2 seconds
		And I fill in "Cardnumber" with "4242424242424242" in the Stripe input field
		And I fill in "Expiry date" with "12/22" in the Stripe input field
		And I fill in "CVC" with "123" in the Stripe input field
		When I click on "Pay for Subscription"
		And I wait 5 seconds
		Then I should see "Please insert valid email"

	# @javascript @stripe_error_cvc
	# Scenario: Visitor cannot become a subscriber if card has wrong CVC number [sad path]
	# 	Given I visit the application
	# 	And I click on "Subscribe"
	# 	And I wait 3 seconds
	# 	And I fill in "name_on_card" with "Thomas Ochman"
	# 	And I fill in "Email" with "thomas@craft.com"
	# 	And I fill in "Cardnumber" with "4000000000000127" in the Stripe input field
	# 	And I fill in "Expiry date" with "12/22" in the Stripe input field
	# 	And I fill in "CVC" with "123" in the Stripe input field
	# 	When I click on "Pay for Subscription"
	# 	And I wait 3 seconds
	# 	Then show me the page
	# 	Then the card got declined with message "The card's security code is incorrect"

	# @javascript	@stripe_errorINSUFF_FUNDS
	# Scenario: Visitor cannot become a subscriber if card is expired [sad path]
	# 	Given I visit the application
	# 	And I click on "Subscribe"
	# 	And I fill in "name_on_card" with "Thomas Ochman"
	# 	And I fill in "Email" with "thomas@craft.com"
	# 	And I fill in "Cardnumber" with "4000000000009995" in the Stripe input field
	# 	And I fill in "Expiry date" with "12/22" in the Stripe input field
	# 	And I fill in "CVC" with "123" in the Stripe input field
	# 	When I click on "Pay for Subscription"
	# 	And I wait 2 seconds
	# 	Then the card got declined with message "Your card has insufficient funds."

	# @javascript @stripe_errorEXPIRED
	# Scenario: Visitor cannot become a subscriber if card is expired [sad path]
	# 	Given I visit the application
	# 	And I click on "Subscribe"
	# 	And I fill in "name_on_card" with "Thomas Ochman"
	# 	And I fill in "Email" with "thomas@craft.com"
	# 	And I fill in "Cardnumber" with "4000000000000069" in the Stripe input field
	# 	And I fill in "Expiry date" with "12/17" in the Stripe input field
	# 	And I fill in "CVC" with "123" in the Stripe input field
	# 	When I click on "Pay for Subscription"
	# 	And I wait 5 seconds
	# 	Then the card got declined with message "Your card has expired."