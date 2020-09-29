Given('I have a suggestion created by an Admin') do
  @admin_suggestion = FactoryBot.create(:suggestion)
	@admin_suggestion.admin_suggested = true
	@admin_suggestion.save!
end

Then('I should see the Admin created suggestions name') do
	if page.respond_to? :should
		page.should have_content(@admin_suggestion.name)
	else
		assert page.has_content?(@admin_suggestion.name)
	end
end

When('I edit that suggestion') do
  visit edit_suggestion_path(@admin_suggestion)
end

When('I complete that suggestion') do
  post completed_suggestion_path(@admin_suggestion)
end
