Given /^I have only an Admin$/ do
  FactoryBot.create(:admin)
end

Given /^I have user types$/ do
  if UserType.all.empty? then
    UserType.create(id: 1, name: "Admin")
    UserType.create(id: 2, name: "Supervisor")
    UserType.create(id: 3, name: "Supporter")
  end
end

Given('I have only an admin and they are logged in') do
  @admin = FactoryBot.create(:admin)
  visit log_in_path
  fill_in "email", :with => @admin.email
  fill_in "password", :with => @admin.password
  click_button "Log in"
end
