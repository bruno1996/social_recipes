require 'rails_helper'

feature 'user view recipes' do
  scenario 'successfully' do
                kitchen = create(:kitchen)

                type = create(:type)

                recipe = Recipe.create(kitchen: kitchen, type: type)

      visit root_path

      click_on 'Cadastrar Receita'

      fill_in 'Nome da Receita',       with: recipe.recipe_name
      select  kitchen.name,            from: 'Cozinha'
      select  type.name,               from: 'Tipo de Comida'
      fill_in 'Quantas Pessoas Serve', with: recipe.how_many_people_serves
      fill_in 'Tempo de Preparação',   with: recipe.preparation_time
      fill_in 'Nivel de Dificuldade',  with: recipe.difficulty_level
      fill_in 'Ingredients',           with: recipe.ingredients
      fill_in 'Passo a Passo',         with: recipe.step_by_step
      attach_file('Foto',"spec/pictures/Torta-de-Abacaxi.jpg")

      click_on 'Postar Receita'

      expect(page).to have_xpath("//img[contains(@src, 'Torta-de-Abacaxi')]")
      expect(page).to have_css("h2", text: recipe.recipe_name)
      expect(page).to have_content kitchen.name
      expect(page).to have_content type.name
      expect(page).to have_content recipe.how_many_people_serves
      expect(page).to have_content recipe.preparation_time
      expect(page).to have_content recipe.difficulty_level
      expect(page).to have_content recipe.ingredients
      expect(page).to have_content recipe.step_by_step

      click_on 'Voltar'

      expect(page).to have_xpath("//img[contains(@src, 'Torta-de-Abacaxi')]")
      expect(page).to have_content recipe.recipe_name
      expect(page).to have_content kitchen.name
      expect(page).to have_content type.name
      expect(page).to have_content recipe.how_many_people_serves
      expect(page).to have_content recipe.preparation_time
      expect(page).to have_content recipe.difficulty_level
      expect(page).to have_content recipe.ingredients
      expect(page).to have_content recipe.step_by_step

    end
  end
