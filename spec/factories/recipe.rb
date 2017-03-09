FactoryGirl.define do
  factory :recipe do

    association :kitchen
    association :type

    avatar { File.new("#{Rails.root}/spec/pictures/Torta-de-Abacaxi.jpg")}
    recipe_name "Torta de Abacaxi"
    how_many_people_serves "10 Pessoas"
    preparation_time "50 min"
    difficulty_level "Médio"
    ingredients "Massa de Torta e Abacaxi"
    step_by_step "Misture Tudo e coloque no forno"

  end
end
