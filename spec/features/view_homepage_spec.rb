require "rails_helper" # required by rspec and spins up rails application

# feature and scenario are only available within spec/features
RSpec.feature "View the homepage" do
  scenario "successfully" do
    visit root_path

    expect(page).to have_css("h1", text: "Todos") #expect is RSPec, have_css is Capybara
  end
end
