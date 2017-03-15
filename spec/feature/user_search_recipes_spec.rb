require 'rails_helper'

  feature 'user search recipes' do
    scenario 'successfully' do
                    kitchen = create(:kitchen)

                    recipe = create(:recipe)

                    type = create(:type)

      visit root_path

      fill_in 'Nome da Receita',       with: recipe.recipe_name

      click_on 'Buscar'

      expect(page).to have_css("h2", text: recipe.recipe_name)
      expect(page).to have_content kitchen.name
      expect(page).to have_content type.name
      expect(page).to have_content recipe.how_many_people_serves
      expect(page).to have_content recipe.preparation_time
      expect(page).to have_content recipe.difficulty_level
      expect(page).to have_content recipe.ingredients
      expect(page).to have_content recipe.step_by_step
    end
    scenario 'search recipe en show' do
                      kitchen = create(:kitchen)

                      recipe = create(:recipe)

                      type = create(:type)

        visit @recipe_path

        fill_in 'Nome da Receita',       with: recipe.recipe_name

        click_on 'Buscar'

        expect(page).to have_css("h2", text: recipe.recipe_name)
        expect(page).to have_content kitchen.name
        expect(page).to have_content type.name
        expect(page).to have_content recipe.how_many_people_serves
        expect(page).to have_content recipe.preparation_time
        expect(page).to have_content recipe.difficulty_level
        expect(page).to have_content recipe.ingredients
        expect(page).to have_content recipe.step_by_step
    end
    scenario 'search without result' do

      visit root_path

      fill_in 'Nome da Receita',      with: "Arroz de Forno"

      click_on 'Buscar'

      expect(page).to have_content("Não a Receitas com Esse Nome")

    end
  end
