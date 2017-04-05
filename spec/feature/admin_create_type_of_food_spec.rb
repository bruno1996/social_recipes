require 'rails_helper'
  feature 'create type of food' do
    scenario 'successfully' do

      user = create(:user)
      login_as(user, :scope => :user)
      type = create(:type)

      visit root_path
      click_on 'Cadastrar Tipo de Comida'
      fill_in 'Tipo de Comida',       with: type.name
      click_on 'Postar Tipo de Comida'

      expect(page).to have_content type.name

      click_on 'Voltar'
    end
    scenario 'valid type of food' do
      user = create(:user)
      login_as(user, :scope => :user)

      visit root_path
      click_on  'Cadastrar Tipo de Comida'
      click_on 'Postar Tipo de Comida'

      expect(page).to have_content 'PREENCHA O TIPO DE COMIDA'
    end
    scenario 'Back Home Page' do
      user = create(:user)
      login_as(user, :scope => :user)

      visit root_path

      click_on 'Cadastrar Tipo de Comida'
      click_on 'Voltar'
    end
  end
