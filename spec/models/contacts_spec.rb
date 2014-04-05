require 'spec_helper'

describe Contact do

  it {should belong_to(:user)}

  it {should validate_presence_of(:email)}
  it { should have_valid(:email).when('MA@gmail.com', "Ny12_12@gmail.com", "12gstuff@me.com", "asd2.lakjsh@google.co") }
  it { should_not have_valid(:email).when('', nil, "@gmail.com", "@", "terrbile@gmail") }

end
