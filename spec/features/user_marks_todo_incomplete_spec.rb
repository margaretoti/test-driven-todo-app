require "rails_helper"

feature "User marks a completed todo as incomplete" do
  scenario "successfully" do
    sign_in
    create_todo "Buy heavy cream"
    
    mark_todo_complete "Buy heavy cream"
    mark_todo_incomplete "Buy heavy cream"

    expect(page).not_to have_completed_todo("Buy heavy cream")
    expect(page).to have_incomplete_todo("Buy heavy cream")
  end
end
