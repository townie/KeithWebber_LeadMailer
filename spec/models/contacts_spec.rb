require 'spec_helper'

describe Contact do

  it {should belong_to(:user)}

  it {should validate_presence_of(:email)}
  it { should have_valid(:email).when('MA@gmail.com', "Ny12_12@gmail.com", "12gstuff@me.com", "asd2.lakjsh@google.co") }
  it { should_not have_valid(:email).when('', nil, "@gmail.com", "@", "terrbile@gmail") }

  it "emails should be unique per user" do
    email =                 FactoryGirl.create(:contact, email:"test@gmail.com")
    dupe_email =            FactoryGirl.build(:contact, email: "test@gmail.com")
    different_user_email =  FactoryGirl.build(:contact, email: "test@gmail.com", user_id: 2)

    expect(email).to be_valid
    expect(dupe_email).to_not be_valid
    expect(different_user_email).to be_valid

  end


end
