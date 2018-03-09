require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do
  let(:registered_application) {RegisteredApplication.create!(name: "new app name", url: "newurltest@test.com") }

  describe "attributes" do
    it "has name and url attributes" do
      expect(registered_application).to have_attributes(name: "new app name", url: "newurltest@test.com")
    end
  end
end
