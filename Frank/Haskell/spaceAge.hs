-- 2. Escreva uma função chamada idade que usando pelo menos um tipo definido por você que receba o tempo de vida em segundos de uma determinada pessoa, o nome de um planeta e devolva a idade desta pessoa em anos caso ela tivesse vivido naquele planeta. Sabendo que o período orbital dos planetas é dado por:
-- a. Mercúrio: 0.2408467 anos terrestres;
-- b. Vênus: 0.61519726 anos terrestres;
-- c. Terra: 1.0 anos terrestre equivalente a 365.25 dias, ou 31.557.600 segundos;
-- d. Marte: 1.8808158 anos terrestres;
-- e. Jupiter: 11.862615 anos terrestres;
-- f. Saturno: 29.447498 anos terrestres;
-- g. Urano: 84.016846 anos terrestres;
-- h. Netuno: 164.79132 anos terrestres;



data Planet = Earth | Mercury | Venus | Mars | Jupiter | Saturn | Uranus | Neptune
earthYearsFromSeconds :: Float -> Float
earthYearsFromSeconds seconds = seconds / 31557600  
ageOn :: Planet -> Float -> Float
ageOn planet seconds = earthYears / case planet of
  Earth   -> 1
  Mercury -> 0.2408467
  Venus   -> 0.61519726
  Mars    -> 1.8808158 
  Jupiter -> 11.862615
  Saturn  -> 29.447498
  Uranus  -> 84.016846
  Neptune -> 164.79132
  where
    earthYears = earthYearsFromSeconds seconds

main = do
  print $ ageOn Earth 757382400
  print $ ageOn Mercury 2134835688
  print $ ageOn Venus 189839836
  print $ ageOn Mars 2129871239
  print $ ageOn Jupiter 901876382
  print $ ageOn Saturn 2000000000
  print $ ageOn Uranus 1210123456
  print $ ageOn Neptune 1821023456