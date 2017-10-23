require 'spec_helper'

describe "Static pages" do

  subject {page}

  describe "Home page" do
    before {visit root_path}

    it {should have_content('Sample App')}
    it {should have_title(full_title(''))}
    it {should have_title('| Home')}
  end

  describe "Help page" do
    before {visit help_path}

    it {should have_content('Help')}
    it {should have_title(full_title('Help'))}
  end

  describe "About page" do
    before {visit about_path}

    it {should have_content('About')}
    it {should have_title(full_title('About Us'))}
  end

  describe "Contact page" do
    before {visit contact_path}

    it {should have_content('Contact')}
    it {should have_title(full_title('Contact'))}
  end

  describe "profile page" do
    let(:user) {FactoryGirl.create(:user)}
    before {visit user_path(user)}

    it {should have_content(user.name)}
    it {should have_title(user.name)}
  end

  describe "signup page" do
    before {visit signup_path}

    let(:submit) {"Create my account"}

    describe "with invalid information" do
      it "should not create a user" do
        expect {click_button submit}.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "user_name", with: "New User"
        fill_in "user_email", with: "user22@example.com"
        fill_in "user_password", with: "foobar"
        fill_in "user_password_confirmation", with: "foobar"
      end

      it "should create a user" do
        expect {click_button submit}.to change(User, :count).by(1)
      end
    end
  end
end