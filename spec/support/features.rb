# declare module at top of file and configure RSpec to include it
# no need to place in rails_helper
module Features
end

RSpec.configure do |config|
  config.include Features, type: :feature
end
