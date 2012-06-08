describe "Authentication" do

  subject { page }

  describe "signin" do
    before { visit signin_path }

    /describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_selector('title', text: 'Sign in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }
    
      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end/

    describe "with valid information" do
      #let(:user) { FactoryGirl.create(:user) }
      before do
        @user = FactoryGirl.create(:user)
        fill_in "Email",    with: @user.email
        fill_in "Password", with: @user.password
        click_button "Sign in"
      end 

      it { should have_selector('title', text: @user.name) }
      it "has the link", :js => true do
         save_and_open_page
         should have_link("Home")
      end
    end
  end
end
