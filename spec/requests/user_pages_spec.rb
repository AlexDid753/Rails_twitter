=begin
require 'spec_helper'

describe "User pages" do

  subject {page}

  describe "signup page" do
    before {visit signup_path}

    it {should have_content('Sign up')}
    it {should have_title(full_title('Sign up'))}
  end
end

describe "edit", :type => :controller do
  let(:user) {FactoryBot.create(:user)}
  before do
    log_in user
    visit edit_user_path(user)
  end

  describe "with valid information" do
    let(:new_name) {"New Name"}
    let(:new_email) {"new@example.com"}
    before do
      fill_in "user_name", with: new_name
      fill_in "user_email", with: new_email
      fill_in "user_password", with: user.password
      fill_in "user_password_confirmation", with: user.password
      click_button "Save changes"
    end

    it {should have_title(new_name)}
    it {should have_selector('div.alert.alert-success')}
    it {should have_link('Sign out', href: signout_path)}
    specify {expect(user.reload.name).to eq new_name}
    specify {expect(user.reload.email).to eq new_email}
  end
end
=end