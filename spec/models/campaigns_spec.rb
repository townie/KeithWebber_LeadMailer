require 'spec_helper'

describe Campaign do

  it { should belong_to(:user) }
  it { should have_many(:contact_campaigns) }

  it { should have_valid(:title).when('MA asd awasd ', "Amzing", "12gstuff@me.com", "crappy Campaigns") }
  it { should_not have_valid(:title).when('', nil) }

  it { should have_valid(:purpose).when('MAKE LOTS OF MONEY', "Amzing", "SELL MORE STUFF", "crappy Campaigns") }
  it { should_not have_valid(:purpose).when('', nil) }

end
