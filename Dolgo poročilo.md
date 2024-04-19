## Dolgo poročilo

- Trenutno stanje: naloga je v večini zaključena potrebno bo spremeni še nekaj malenkosti.
- Opomba: več podrobnosti o samih funkcijah, vhodnih podatkih, delovanju se nahajajo v komentarjih datotek. 
- Opis programa: začel sem s tem, da sem definiral magnetno polje
  $$B(x,y) =\Big(-\frac{4}{\pi}\sum_{n=1,3,\dots}^\infty \frac{1}{n}e^{-2\pi n \frac{y}{\lambda}}\cos(2\pi n\frac{x}{\lambda}), \frac{4}{\pi}\sum_{n=1,3,\dots}^\infty \frac{1}{n}e^{-2\pi n \frac{y}{\lambda}}\sin(2\pi n\frac{x}{\lambda})\Big) $$
  To je v datoteki B.m + datoteka inf_sum.m, ki izračuna neskončno "vsoto" (do neke natančnosti) za dano funkcijo.
  
Naslednji problem, ki sem se ga lotil je kako izračunati kote, ki so potrebni za izračun upornosti v dani točki. Ta del je bil dokaj preprost, saj kot izračunamo preko skalarnega produkta $$\cos(\phi) = \frac{B(x,y) \cdot \vec{j}}{||B(x,y)||\cdot ||\vec{j}||}$$ kar se nahaj v datoteki angleBj.m (iz oblike žice je jasno, da je vektor $\vec{j}$ enak vektorju $(1,0)$ ali $(0, \pm)$, v vsakem primeru $||\vec{j}|| = 1$, zato bi lahko izpustili ta faktor v zgornjem izrazu). 

Kar je bilo potrebno narediti naprej je sledeče: ker je sam analitičen integral precej kompliciran, je ideja, da se ga aproksimira, tako, da žico razdelimo na dovolj majhne odseke $dl$, ter žico obravnavamo kot množico točk, ter uporabimo eno od disktretnih metod (Riemannove vsote, trapezna medota...). To storim v datoteki current_den.m, kjer preko for zank generiram točke na vertikalnih delih žice in horizontalnih delih žice ločeno. Če imamo $N$ prepogibanj in horizontalno dolžino žice $L$, je dolžina horizontalnega delčka enaka $\frac{L}{N-1}$. Dolžina vertikalnih delov je vhodni podatek $H$. Za lažjo predstavo sem napisal program plotW.m za izris točk, ki predstavljajo žico.

Add pic

Ko sem enkrat generiral točke/razdelil žico na manjše dele, je bilo potrebno izračunati upornosti v vsaki od teh točk. Upor $r$ se izračuna kot 

$$r(\phi) = r_0(1 + 0.02\cdot \cos^2(\phi)).$$
  
Tukaj je $\phi = \phi(x,y)$ kot med magnetnim poljem $B(x,y)$ in vektorjem toka $\vec{j}$. Da sem dobil sezname kotov, sem preko for zanke dostopal do točk na žici, ki sem jih dobil preko funkcije current_den.m in jih zapisal v nov seznam. To sem vse storil v datoteki angles.m. 
Opomba: Napisano imam tudi funkcijo angles2.m. ki naredi isto kot funkcija angles.m, le bistveno hitreje saj ne potrebuje delati podvojenih izračunov. Temelji pa na predpostavki, da ima magnetno polje $B$ ločljive spremenljivke tj. $B(x,y) = (f_1(x)\cdot g_1(y), f_2(x)\cdot g_2(y))$, za neki funkcije $f_i, g_i$, $i \in \{1, 2\}$. V navodilih naloge je bila napaka in je bilo magnetno polje v obliki
$$B(x,y) =\Big(-\frac{4}{\pi}\sum_{n=1,3,\dots}^\infty \frac{1}{n}e^{-2\pi\frac{y}{\lambda}}\cos(2\pi n\frac{x}{\lambda}), \frac{4}{\pi}\sum_{n=1,3,\dots}^\infty \frac{1}{n}e^{-2\pi \frac{y}{\lambda}}\sin(2\pi n\frac{x}{\lambda})\Big) $$
kjer je eksponentna funkcija neodvisna od $n$, zato lahko zapišemo $B(x,y) = (f_1(x)\cdot g(y), f_2(x)\cdot g(y)) =  g(y)\cdot(f_1(x), f_2(x))$, kjer so 
$$f_1(x) =\Big(-\frac{4}{\pi}\sum_{n=1,3,5,\dots}^\infty \frac{1}{n}\cos(2\pi n\frac{x}{\lambda})\Big)$$
$$f_2(x) =\Big(-\frac{4}{\pi}\sum_{n=1,3,5,\dots}^\infty \frac{1}{n}\sin(2\pi n\frac{x}{\lambda})\Big)$$
$$g(y) = e^{-2\pi\frac{y}{\lambda}}.$$
Če izračunamo skalarni produkt za tak $B$ in za $\vec{j} = (1,0)$, dobimo
$$\cos(\phi) = \frac{B(x,y) \cdot \vec{j}}{||B(x,y)||\cdot ||\vec{j}||} = \frac{g(y)\cdot(f_1(x), f_2(x)) \cdot (1,0)}{||g(y)\cdot(f_1(x), f_2(x))||} = $$

