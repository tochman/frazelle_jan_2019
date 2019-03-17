/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb
import "../css/tailwind.css"
import { locale } from "core-js";

document.addEventListener('turbolinks:load', () => {
	const subscriptionForm = document.getElementById('new_user')

	if (subscriptionForm) {
		const stripe = Stripe('pk_test_jYtmt7GBmyKDm0S0zcOMZEb8')
		const elements = stripe.elements(locale)

		let cardNumberElement = elements.create('cardNumber');
		let cardExpiryElement = elements.create('cardExpiry');
		let cardCvcElement = elements.create('cardCvc');

		cardNumberElement.mount('#card_number');
		cardExpiryElement.mount('#exp_date');
		cardCvcElement.mount('#cvc');

		subscriptionForm.addEventListener('submit', (event) => {
			event.preventDefault();
			stripe.createToken(cardNumberElement).then(result => {
				const hiddenInput = document.createElement('input')
				hiddenInput.setAttribute('type', 'hidden')
				hiddenInput.setAttribute('name', 'stripeToken')
				hiddenInput.setAttribute('value', result.token.id)
				subscriptionForm.appendChild(hiddenInput)
				subscriptionForm.submit()
			})
		})

	}
})