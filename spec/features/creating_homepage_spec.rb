require "rails_helper"

  RSpec.feature "Creating Home Page" do

    scenario do
      visit '/'

      expect(page).to have_link('Motiv-Action')
      expect(page).to have_link('Home')
      expect(page).to have_content('Work it out!')
    end
end
