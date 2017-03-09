require 'rails_helper'

  feature 'admin create kitchen' do
    scenario 'successfully' do

                      kitchen = create(:kitchen)


    visit root_path

    click_on 'Cadastrar Cozinha'

    fill_in 'Nome da Cozinha',          with: kitchen.name

    click_on 'Postar Cozinha'

    expect(page).to have_css("h2", text: "Cozinha Cadastrada")
    expect(page).to have_content kitchen.name

    click_on 'Voltar'

    end
    scenario 'validate kitchen' do

      visit root_path

      click_on 'Cadastrar Cozinha'

      click_on 'Postar Cozinha'

      expect(page).to have_content('PREENCHA O NOME DA COZINHA')

      click_on 'Voltar'
    end
    scenario 'back in show' do

      visit root_path

      click_on 'Cadastrar Cozinha'

      click_on 'Voltar'
    end
  end
