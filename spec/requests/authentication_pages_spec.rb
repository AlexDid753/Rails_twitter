
=begin
require 'spec_helper'


describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signup_path }

    it { should have_content('Sign up') }
    it { should have_title('Sign up') }


    describe "with valid information" do
      let(:user) { FactoryBot.create(:user) }
      before do
        fill_in "user_email",    with: user.email.upcase
        fill_in "user_password", with: user.password
        click_button "Create my account"
      end

      it { should have_title(user.name) }
      it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('Log out',    href: logout_path) }
      it { should_not have_link('Sign in', href: login_path) }

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('Sign out') }
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end
    describe "after visiting another page" do
      before { visit root_path }
      it { should_not have_selector('div.alert.alert-error') }
    end
  end

end
=end
