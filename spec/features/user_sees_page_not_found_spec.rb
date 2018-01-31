describe "user sees 404 error page" do
  context "visit non-existent page" do
    it "shows the dashboard" do
      visit '/non-existent-page'

      expect(current_path).to eq('/non-existent-page')
      expect(page).to have_content("Oops - you've stumbled upon an unknown run...")
    end
  end
end
