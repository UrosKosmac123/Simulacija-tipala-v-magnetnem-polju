## Dolgo poročilo

- Trenutno stanje: naloga je v večini zaključena potrebno bo spremeni še nekaj malenkosti.
- Opomba: več podrobnosti o samih funkcijah, vhodnih podatkih, delovanju se nahajajo v komentarjih datotek. 
- Opis programa: začel sem s tem, da sem definiral magnetno polje
  $$B(x,y) =\Big(-\frac{4}{\pi}\sum_{n=1,3,\dots}^\infty \frac{1}{n}e^{-2\pi n \frac{y}{\lambda}}\cos(2\pi n\frac{x}{\lambda}), \frac{4}{\pi}\sum_{n=1,3,\dots}^\infty \frac{1}{n}e^{-2\pi n \frac{y}{\lambda}}\sin(2\pi n\frac{x}{\lambda})\Big) $$
  To je v datoteki B.m + datoteka inf_sum.m, ki izračuna neskončno "vsoto" (do neke natančnosti) za dano funkcijo.
  
Naslednji problem, ki sem se ga lotil je kako izračunati kote, ki so potrebni za izračun upornosti v dani točki. Ta del je bil dokaj preprost, saj kot izračunamo preko skalarnega produkta $$\cos(\phi) = \frac{B(x,y) \cdot \vec{j}}{||B(x,y)||\cdot ||\vec{j}||}$$ kar se nahaj v datoteki angleBj.m (iz oblike žice je jasno, da je vektor $\vec{j}$ enak vektorju $(1,0)$ ali $(0, \pm)$, v vsakem primeru $||\vec{j}|| = 1$, zato bi lahko izpustili ta faktor v zgornjem izrazu). 

Kar je bilo potrebno narediti naprej je sledeče: ker je sam analitičen integral precej kompliciran, je ideja, da se ga aproksimira, tako, da žico razdelimo na dovolj majhne odseke $dl$, ter žico obravnavamo kot množico točk, ter uporabimo eno od disktretnih metod (Riemannove vsote, trapezna medota...). To storim v datoteki current_den.m, kjer preko for zank generiram točke na vertikalnih delih žice in horizontalnih delih žice ločeno. Če imamo $N$ prepogibanj in horizontalno dolžino žice $L$, je dolžina horizontalnega delčka enaka $\frac{L}{N-1}$. Dolžina vertikalnih delov je vhodni podatek $H$.
  
  
