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

			before do
				@questions = (1..5).each.collect {|i|
					question = Question.new title: "Title #{i}",
						content: "Mussum Ipsum #{i}", difficulty: i

					#simulando uma questão salva no banco de dados, logo, precisa ter um id
					question.id = i
					question
				}
				render file: "questions/index"
			end

			it "omits empty message" do
				assert_select "p.info", count: 0,
					text: "Nenhuma questao cadastrada"
			end

			it "shows table" do
				assert_select "table" do
					assert_select "thead tr", 1
					assert_select "tbody tr", @questions.count
				end
			end
		end
	end
end