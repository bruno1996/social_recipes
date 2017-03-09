require 'rails_helper' do

scenario 'and view last 20 recipes' do
		first_recipe = create(:recipe, name: "Torta", difficult_level: "Fácil")

		recipes = create_list(:recipe, 21)

		visit root_path

		recipes.each do |recipe|
			expect(page).to have_css("h2", text: recipe.name)
			expect(page).to have_content("Dificuldade: #{recipe.difficult_level}")
			expect(page).to have_content("Serve #{recipe.serves} pessoas")
			expect(page).to have_content("Tempo de preparo: #{recipe.cook_time}")
		end

		expect(page).not_to have_content(first_recipe.name)
		expect(page).not_to have_content("Dificuldade: #{first_recipe.difficult_level}")
		expect(page).not_to have_content("Serve #{first_recipe.serves} pessoas")
		expect(page).not_to have_content("Tempo de preparo: #{first_recipe.cook_time}")
	end
end
