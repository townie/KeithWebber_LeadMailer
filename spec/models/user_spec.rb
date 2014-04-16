require 'spec_helper'

describe User do

  context 'Assocations' do

    it { should have_many(:identities) }
    it { should have_many(:campaigns) }
    it { should have_many(:contacts) }
    it { should have_many(:materials).through(:campaigns)}

  end

  context '-validating correct user input-' do

    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:company)}
    it {should validate_presence_of(:phone_number_primary)}
    it {should validate_presence_of(:email)}

    it "requires a valid phone number" do
      phone = FactoryGirl.build(:user, phone_number_primary: "98765678987656789098765")
      expect(phone.valid?).to be_false
      expect(phone.errors[:phone_number_primary]).to include "is invalid"

      phone = FactoryGirl.build(:user, phone_number_primary: "718 272 340")
      expect(phone.valid?).to be_false
      expect(phone.errors[:phone_number_primary]).to include "is invalid"
    end

    it "requires a valid email"do
      email = FactoryGirl.build(:user, email: nil)

      expect(email).to_not be_valid
      expect(email.errors[:email]).to include "can't be blank"
    end

    it "requires a unique email"do
      unique_email = FactoryGirl.create(:user, email: "test@gmail.com")
      dupe_email = FactoryGirl.build(:user, email: "test@gmail.com")

      expect(dupe_email).to_not be_valid
      expect(dupe_email.errors[:email]).to include "has already been taken"
    end

    it "requires a secure password"do
      no_first_name = FactoryGirl.build(:user, password: nil)

      expect(no_first_name).to_not be_valid
      expect(no_first_name.errors[:password]).to include "can't be blank"
    end

    it "creates a new user when passed valid paramters" do
      prev_count = User.count
      valid_user = FactoryGirl.create(:user)
      expect(valid_user).to be_valid
      expect(valid_user.errors).to be_blank
      expect(User.count).to eq(prev_count + 1)
    end
  end

  context "Using LinkedIn omniAuth" do
    before do
      OmniAuth.config.test_mode = true
      OmniAuth.config.on_failure = Proc.new { |env|
        OmniAuth::FailureEndpoint.new(env).redirect_to_failure
      }
    end
  end


end
