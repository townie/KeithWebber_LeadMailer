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

  it "method handle a omnicontact GMAIL hash to parse the contacts into new contacts " do
    current_user = FactoryGirl.create(:user)
    prev_contacts = Contact.count
    response = [{:id=>
               "http://www.google.com/m8/feeds/contacts/kei",
              :first_name=>"Info",
              :last_name=>nil,
              :name=>"Info",
              :email=>"infbeo@bostoncontemporaries.com",
              :gender=>nil,
              :birthday=>nil,
              :profile_picture=>nil,
              :relation=>nil},
             {:id=>
               "http://www.google.com/m8/feeds/contacts/keit",
              :first_name=>"Luis",
              :last_name=>"Ramirez",
              :name=>"Luis Ramirez",
              :email=>"Luis.Ramiasrez@autoglassshop.com",
              :gender=>nil,
              :birthday=>nil,
              :profile_picture=>nil,
              :relation=>nil}]

    Contact.gmail_email_catcher(response, current_user)

    expect(Contact.count).to eq(prev_contacts + 2)
    expect(Contact.first.email).to eq("infbeo@bostoncontemporaries.com")
    expect(Contact.last.email).to eq("Luis.Ramiasrez@autoglassshop.com")
  end
end




