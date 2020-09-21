module NavigationHelpers
  # This file maps names to paths, and is used by
  # When /^I go to (.+)$/ do |page_name|

  def path_to(page_name)
    case page_name
  when /^the homepage/
      root_path
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join("_").to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\nTry adding a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
