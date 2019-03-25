Given("the following articles exist") do |table|
  table.hashes.each do |article|
    category = Category.find_or_create_by(name: article[:category])
    article.except!('category_id')
    create(:article, article.merge(category: category))
  end
end

Given("the following categories exist") do |table|
	table.hashes.each do |category|
		create(:category, category)
	end
end

When("I visit the {string} page") do |page_name|
	page = page_name == 'landing' ? root_path : page_name
	visit page
end

When('I visit the application') do
	visit root_path
end

Given("I click on {string}") do |link|
	click_on link
end

Given("I fill in {string} with {string}") do |element, value|
	fill_in element, with: value
end

And("the following users exist") do |table|
	table.hashes.each do |user|
		create(:user, user)
	end
end

Given("I am logged in as {string}") do |email|
	user = User.find_by(email: email)
	user.confirm
	login_as(user, scope: :user)
end

Given("I am in {string}") do |city|
	Geocoder.configure(lookup: :test, ip_lookup: :test)

	Geocoder::Lookup::Test.set_default_stub(
		[
			{
				'coordinates'  => [40.7143528, -74.0059731],
				'address'      => 'New York, NY, USA',
				'state'        => 'New York',
				'state_code'   => 'NY',
				'country'      => 'United States',
				'country_code' => 'US'
			}
		]
	)
end

Then('stop') do
	binding.pry
end

Then("show me the page") do
  save_and_open_page
end

Then("I fill in {string} with my temp password") do |field|
  fill_in field, with: @user.temp_password
end