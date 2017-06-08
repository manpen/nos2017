q
p
s/Dinge/Zeuch/
p
s/Zeuch/Manus Vortrag ist besser/
p
s/besser/doof/
p
s/.* ist/Cyriax ist/
p
s/.* ist (.*)/Manu sieht \1 aus/
p
s/.*/111-11111/
p
s/(1*)-(1*)/\2-\1/

:loop
p
s/1-1/-/
t loop
s/-//


