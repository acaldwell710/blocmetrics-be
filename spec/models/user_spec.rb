require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  let(:user) { User.create!(email: "", encrypted_password: "") }


  describe "attributes" do
    it "has email and password attributes" do
      expect(user).to have_attributes(email: "", encrypted_password: "")
    end
  end
end
