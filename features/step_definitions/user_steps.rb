Given /^I have an Admin$/ do
	check_user_types
  @admin = FactoryBot.create(:admin)
	FactoryBot.create(:core)
end

def check_user_types
	unless UserType.all.count == 3 then
    UserType.create(id: 1, name: "Admin", created_at: DateTime.now, updated_at: DateTime.now)
    UserType.create(id: 2, name: "Supervisor", created_at: DateTime.now, updated_at: DateTime.now)
    UserType.create(id: 3, name: "Supporter", created_at: DateTime.now, updated_at: DateTime.now)
  end
end

Given /^I have user types$/ do
  unless UserType.all.count == 3 then
		UserType.create(id: 1, name: "Admin", created_at: DateTime.now, updated_at: DateTime.now)
    UserType.create(id: 2, name: "Supervisor", created_at: DateTime.now, updated_at: DateTime.now)
    UserType.create(id: 3, name: "Supporter", created_at: DateTime.now, updated_at: DateTime.now)
  end
end

Given('I have an admin and they are logged in') do
	check_user_types
  @admin = FactoryBot.create(:admin)
	FactoryBot.create(:core)
  visit root_path
  fill_in "email", :with => @admin.email
  fill_in "password", :with => @admin.password
  click_button "Log in"
end


When('I log in') do
	visit root_path
  fill_in "email", :with => @admin.email
  fill_in "password", :with => @admin.password
  click_button "Log in"
end

Given('I have the supporter pre-requisites') do
	FactoryBot.create(:core)
	check_user_types
	if User.first.nil?
		@admin = FactoryBot.create(:admin)
	end
	unless SupporterLevel.where(name: "Bronze").nil?
		SupporterLevel.create(name: "Bronze", amount: "5.00", description: "My awesome supporter level")
	end
end

Given('I have a supporter and pre-requisites') do
	check_user_types
	if User.first.nil?
		@admin = FactoryBot.create(:admin)
	end
	unless SupporterLevel.where(name: "Bronze").nil?
		@supporter_level = SupporterLevel.create(name: "Bronze", amount: "5.00", description: "My awesome supporter level")
	else
		@supporter_level = SupporterLevel.where(name: "Bronze")
	end
	@supporter = FactoryBot.create(:supporter, supporter_level_id: @supporter_level.id)
end

When('I log in as a supporter') do
	visit root_path
  fill_in "email", :with => @supporter.email
  fill_in "password", :with => @supporter.password
  click_button "Log in"
end

Given('I have an admin and a user and the user is logged in') do
	check_user_types
	if User.first.nil?
		@admin = FactoryBot.create(:admin)
	end
	@supporter = FactoryBot.create(:supporter)
	visit root_path
  fill_in "email", :with => @supporter.email
  fill_in "password", :with => @supporter.password
  click_button "Log in"
end

Given('I have an admin and a user and the admin is logged in') do
	check_user_types
	if User.first.nil?
		@admin = FactoryBot.create(:admin)
	end
	unless SupporterLevel.where(name: "Bronze").nil?
		@supporter_level = SupporterLevel.create(name: "Bronze", amount: "5.00", description: "My awesome supporter level")
	else
		@supporter_level = SupporterLevel.where(name: "Bronze")
	end
	@supporter = FactoryBot.create(:supporter, supporter_level_id: @supporter_level.id)
	FactoryBot.create(:core)
	visit root_path
  fill_in "email", :with => @admin.email
  fill_in "password", :with => @admin.password
  click_button "Log in"
end

Given('I have a supporter and they are logged in') do
	check_user_types
	if User.first.nil?
		@admin = FactoryBot.create(:admin)
	end
	unless SupporterLevel.where(name: "Bronze").nil?
		@supporter_level = SupporterLevel.create(name: "Bronze", amount: "5.00", description: "My awesome supporter level")
	else
		@supporter_level = SupporterLevel.where(name: "Bronze")
	end
	@supporter = FactoryBot.create(:supporter, supporter_level_id: @supporter_level.id)
	FactoryBot.create(:core)
	visit root_path
  fill_in "email", :with => @admin.email
  fill_in "password", :with => @admin.password
  click_button "Log in"
end

When('I log out and log in as a supporter') do
  visit log_out_path
	visit root_path
	fill_in "email", :with => @supporter.email
  fill_in "password", :with => @supporter.password
  click_button "Log in"
end

When('I log out and log in as an admin') do
	visit log_out_path
	visit root_path
	fill_in "email", :with => @admin.email
  fill_in "password", :with => @admin.password
  click_button "Log in"
end
