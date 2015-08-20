require 'rails_helper'

describe User do
  before do
    @user = User.create()
  end

  describe '#admin?' do
    it "assigns the user with a role of admin" do
    end
  end

  describe '#standard?' do
    it "assigns the user with a role of standard"
    end
  end 
end