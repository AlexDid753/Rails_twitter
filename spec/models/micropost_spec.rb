require 'spec_helper'

describe Micropost do

  let(:user) { FactoryBot.create(:user) }
  before { @micropost = user.microposts.build(content: "Lorem ipsum") }

  subject { @micropost }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  #its(:user) { should eq user }
  it { should respond_to(:user) }

  it 'user should eq user' do
    user.should eq user
  end

  it { should be_valid }

  describe "when user_id is not present" do
    before { @micropost.user_id = nil }
    it { should_not be_valid }
  end
end