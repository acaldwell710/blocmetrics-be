require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:registered_application) {RegisteredApplication.create!(name: "new app name", url: "newurltest@test.com") }
  let(:event) { Event.create!(name: 'Event name', registered_application: registered_application) }

  describe "attributes" do
    it "has a name attribute" do
      expect(event).to have_attributes(name: "Event name")
    end
  end
end
