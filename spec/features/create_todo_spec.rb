require "rails_helper"

RSpec.feature "Create a todo" do
  scenario "successfully" do
    visit root_path

    click_on "Create a new todo" # places us on the create todo pages

    fill_in "Title", with: "Buy eggs"
    click_on "Create Todo"

    expect(page).to have_css("ul.todos li", text: "Buy eggs") # selector should just provide enough context so know
    # expect(page).to have_content("Buy eggs") # less restrictive so do not use
  end
end