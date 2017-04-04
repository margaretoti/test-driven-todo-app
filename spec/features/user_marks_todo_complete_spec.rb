require "rails_helper"

RSpec.feature "User marks a todo complete" do
  scenario "successfully" do
    # Factory girl todo creation
    # Factory girl persists data and can be uncessary as it slows down the test suite
    # create(:todo, title: "Buy milk", owner_email: "person@example.com")

    # Testing scopes is a great case for Factory girl
    # example test todos completed method
    # complete_todo = create(:todo, :completed)
    # incomplete_todo = create(:todo, :incomplete)
        # alternative is complete_todo = Todo.create!(completed_at: Time.current, ownder_email: "person")
    # see github.com/joshclayton/new-test-driven-todos
    # Factory
    # factory :todo do
    #   owner_email { "person@example.com" }
    #   trait :completed do
    #     completed_at {Time.current}
    #   end
    #   trait :incomplete do
    #     completed_at nil
    #   end
    # end

    sign_in
    create_todo "Buy milk"
    mark_todo_complete "Buy milk"

    expect(page).to have_completed_todo("Buy milk")
    expect(page).not_to have_todo("Buy milk")
  end
end
