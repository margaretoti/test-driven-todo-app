require "rails_helper"

RSpec.feature "User views own todos" do
  scenario "successfully" do
    visit root_path

    # assume that controller redirects us to sign in
    # we are now on sign in page
    fill_in "Email", with: "person@example.com" # good testing domains are example.com and test.com
    click_on "Sign in"

    click_on "Create a new todo" # places us on the create todo pages

    fill_in "Title", with: "Buy eggs"
    click_on "Create Todo"

    visit sign_in_path

    fill_in "Email", with: "different@example.com" # good testing domains are example.com and test.com
    click_on "Sign in"

    click_on "Create a new todo" # places us on the create todo pages

    fill_in "Title", with: "Buy milk"
    click_on "Create Todo"

    expect(page).to have_css("ul.todos li", text: "Buy milk")
    expect(page).not_to have_css("ul.todos li", text: "Buy eggs")
  end
end
