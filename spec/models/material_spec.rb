require 'spec_helper'

describe Material do

  it { should belong_to(:campaign) }

  it { should have_valid(:title).when('MA email blast', "GREAT eamil") }
  it { should_not have_valid(:title).when('', nil) }

end
