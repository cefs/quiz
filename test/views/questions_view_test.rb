require "minitest_helper"

describe "Questions View Test" do
	describe "index" do
		describe "with no questions" do

			before do
				@questions = []
				render file: "questions/index"
				#puts rendered => mostrar código html no terminal
			end

			it "shows empty message" do
				assert_select "p.info", "Nenhuma questao cadastrada"
			end

			it "omits table" do
				assert_select "table", 0
			end
		end

		describe "with saved questions" do
			it "omits empty message"
			it "shows table"
		end
	end
end