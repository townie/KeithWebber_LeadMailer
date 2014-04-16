require 'spec_helper'

describe EmailTemplate do

  it { should have_many(:campaigns)}

  it { should have_valid(:title).when('MA email blast', "GREAT eamil") }
  it { should_not have_valid(:title).when('', nil) }

  it { should have_valid(:filename).when('email1.html.erb', "email2.text.erb") }
  it { should_not have_valid(:filename).when('', nil) }

end
