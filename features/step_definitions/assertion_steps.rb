Then("I should see {string}") do |content|
	expect(page).to have_content content
end

Then("I should not see {string}") do |content|
	expect(page).not_to have_content content
end

Then("I should see an article image") do
  expect(page).to have_selector(".article_image")
end

Then("I should see {string} for {string}") do |expected_content, title|
	@article = Article.find_by_title(title)
	within("#article_#{@article.id}") do
		expect(page).to have_content expected_content
	end
end

Then("I should not see {string} for {string}") do |expected_content, title|
	@article = Article.find_by_title(title)
	within("#article_#{@article.id}") do
		expect(page).not_to have_content expected_content
	end
end

Then("I should be on subscription page") do
	expect(current_path).to eq new_user_registration_path
end

Then("I should see {string} in {string}") do |expected_content, name|
	category = Category.find_by_name(name)
	within("#category_#{category.id}") do
		expect(page).to have_content expected_content
	end
end

Then("I click {string}") do |element|
	click_on element
end