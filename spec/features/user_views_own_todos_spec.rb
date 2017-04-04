require "rails_helper"

RSpec.feature "User views own todos" do
  scenario "successfully" do
    # sign_in alone introduces the mystery guest problem,
    # because person who is signed in is implicit and it depends
    # on who is signed in below. In this case, use sign_in_as
    sign_in_as "person@example.com"
    create_todo "Buy eggs"

    sign_in_as "different@example.com"
    create_todo "Buy milk"

    expect(page).to have_todo("Buy milk")
    expect(page).not_to have_todo("Buy eggs")
  end
end
