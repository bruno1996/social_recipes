require "rails_helper"
 feature 'view 20 lasts' do
   scenario 'successfully' do
     first_recipe = Recipe.create(recipe_name:"Bolo de Cenoura",
                                  difficulty_level:"Fácil",
                                  how_many_people_serves: "8 Pessoas",
                                  preparation_time:60)

      recipes = create_list(:recipe, 21)

      visit root_path

      recipes.each do |recipe|
        expect(page).to have_css("h2", text: recipe.recipe_name)
        expect(page).to have_content(recipe.difficulty_level)
        expect(page).to have_content(recipe.how_many_people_serves)
        expect(page).to have_content(recipe.preparation_time)
      end

    expect(page).not_to have_content(first_recipe.recipe_name)
    expect(page).not_to have_content(first_recipe.difficulty_level)
    expect(page).not_to have_content(first_recipe.how_many_people_serves)
    expect(page).not_to have_content(first_recipe.preparation_time)
   end
 end
