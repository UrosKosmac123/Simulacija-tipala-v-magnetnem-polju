# Dolgo poročilo

## Opis problema 
Dan imamo magnetni enkoder, ki se pomika vzdolž izmenično namagnetenega traku. V tem ekoderju se nahaja AMR senzor (anizotropni magnetno uporovni senzor) to je senzor ki se odziva na premik po magnetnem traku, uporablja  pa lastnost magnetizma, ki spremninja vrednost upornosti glede na jakost magnetnega polja. Magnetno polje $\vec{B}$ nad trakom je podano z enačbo $$B(x,y) =\Big(-\frac{4}{\pi}\sum_{n=1,3,\dots}^\infty \frac{1}{n}e^{-2\pi n \frac{y}{\lambda}}\cos(2\pi n\frac{x}{\lambda}), \frac{4}{\pi}\sum_{n=1,3,\dots}^\infty \frac{1}{n}e^{-2\pi n \frac{y}{\lambda}}\sin(2\pi n\frac{x}{\lambda})\Big), $$
kjer sta $B_0 = 50mT$ in $\lambda = 2mm$. AMR senzor interpretiramo kot tanko žičko, katere upornost je odvisna od kota med tokovno gostoto v žički $\vec{j}$ in magnetnim poljem $\vec{B}$ , ki ga vsiljuje izmenično namagneten trak, in sledi enačbi $$ r(\phi) = r_0 (1 + 0.02\cdot \cos^2(\phi)), $$ kjer je $\phi = \phi(x,y) = \angle(\vec{B}, \vec{j})$ ($\vec{B}$ in $\vec{j}$ sta oba odvisna od $(x, y)$). Skupna upornost AMR upora s centrom na koordinati $x$ izračunamo kot $$R(x) = \int_P r(\phi) \, \, dl, $$ kjer je $y$ fiksen in $P$ žica. Formalno to pomeni, če je 
$$ P: [0, 1] \rightarrow \mathbb{R}^2 \\
         t \mapsto P(t) = (x(t), \,y(t))$$
parametrizacija žice (ali katerekoli druge druge krivulje), definiramo družino translacij te žice kot $P_{x_0}(t) \coloneqq (x_0, 0) + P(t)$ in je  skupna upornost dana kot krivuljni integral
$$R(x_0) = \int_0^1 P_{x_0}(t) \, \, |\dot{P_{x_0}}(t)|\, dt = \int_0^1 P_{x_0}(t) \, \, |\dot{P}(t)| \,dt$$


![image](https://github.com/UrosKosmac123/Simulacija-tipala-v-magnetnem-polju/assets/64798766/ce3ac5a4-6902-4579-aa86-a713d89d01bb)

## Naloga 
  - Sprogramiraj računalniški model senzorja v polju, ki ustreza zgornjim enačbam. Za dimenzije senzorja uporabi $H=0.5mm$, $h=0.01mm$, $L=0.2mm$ in št. dolžin uporovne žice $N=10$. Uporovno žico razdeli na majhne odseke s pripadajočimi koordinatami v prostoru in smerjo tokovne gostote, iz česar izračunaš njihovo dolžinsko upornost.
  - Izriši potek skupne upornosti R(x) v odvisnosti od pomika vzdolž x osi od x=-4 do 4mm!
  -  Na isti graf nariši še R(x) za L=0.5mm. Kaj ti pove rezultat o tem, kako širok senzor naj uporabimo?

## Opis programa
- Opomba: več podrobnosti o samih funkcijah, vhodnih podatkih, delovanju se nahajajo v komentarjih datotek. 

Začel sem s tem, da sem definiral magnetno polje
$$B(x,y) =\Big(-\frac{4}{\pi}\sum_{n=1,3,\dots}^\infty \frac{1}{n}e^{-2\pi n \frac{y}{\lambda}}\cos(2\pi n\frac{x}{\lambda}), \frac{4}{\pi}\sum_{n=1,3,\dots}^\infty \frac{1}{n}e^{-2\pi n \frac{y}{\lambda}}\sin(2\pi n\frac{x}{\lambda})\Big) $$
To je v datoteki B.m + datoteka inf_sum.m, ki izračuna neskončno "vsoto" (do neke natančnosti) za dano funkcijo.

Naslednji problem, ki sem se ga lotil je kako izračunati kote, ki so potrebni za izračun upornosti v dani točki. Ta del je bil dokaj preprost, saj kot izračunamo preko skalarnega produkta $$\cos(\phi) = \frac{B(x,y) \cdot \vec{j}}{||B(x,y)||\cdot ||\vec{j}||}$$ kar se nahaj v datoteki angleBj.m (iz oblike žice je jasno, da je vektor $\vec{j}$ enak vektorju $(1,0)$ ali $(0, \pm1)$, v vsakem primeru $||\vec{j}|| = 1$, zato bi lahko izpustili ta faktor v zgornjem izrazu). 

Kar je bilo potrebno narediti naprej je sledeče: ker je sam analitičen integral precej kompliciran, je ideja, da se ga aproksimira, tako, da žico razdelimo na dovolj majhne odseke $dl$, ter žico obravnavamo kot množico točk, ter uporabimo eno od disktretnih metod (Riemannove vsote, trapezna medota...). To storim v datoteki current_den.m, kjer preko for zank generiram točke na vertikalnih delih žice in horizontalnih delih žice ločeno. Če imamo $N$ prepogibanj in horizontalno dolžino žice $L$, je dolžina horizontalnega delčka enaka $\frac{L}{N-1}$. Dolžina vertikalnih delov je vhodni podatek $H$. Za lažjo predstavo sem napisal program plotW.m za izris točk, ki predstavljajo žico.

![image](https://github.com/UrosKosmac123/Simulacija-tipala-v-magnetnem-polju/assets/64798766/bc818e71-a579-4a0f-9a00-dd5dff1eb6be)
(tukaj sem uporabil podatke $x = 0$mm, $h = 0.01$mm, $H = 0.5$mm, $L = 0.2$mm, $N = 10$ in število točk $1000$)

Ko sem enkrat generiral točke/razdelil žico na manjše dele, je bilo potrebno izračunati upornosti v vsaki od teh točk. Upor $r$ se izračuna kot 

$$r(\phi) = r_0(1 + 0.02\cdot \cos^2(\phi)).$$
  
Tukaj je $\phi = \phi(x,y)$ kot med magnetnim poljem $B(x,y)$ in vektorjem toka $\vec{j}$. Da sem dobil sezname kotov, sem preko for zanke dostopal do točk na žici, ki sem jih dobil preko funkcije current_den.m in jih zapisal v nov seznam. To sem vse storil v datoteki angles.m. V datoteki angles.m uporabljam še funkcijo, napisana v datoteki current_sgn.m, ki vrne predznak smeri toka za dano vertikalni segment. Še zadnja ključna funkcija je R.m, ki iz kotov, v vsaki točki izračuna upor $r$. Nato preko trapezne metode izračunamo celotno upornost, ki je podana z
$$R(x) = \int_P r(\phi) \,dl$$
kjer je $P$ - parametrizacija žice in $dl$ - zelo majhen (infitezimalen) del žice in $R(x)$ celotna upornost žice, ki se začne pri $x$. Za iste podatke kot pri zgornji sliki ter za $x \in [-4\text{mm}, 4\text{mm}]$ in točnost polja $\epsilon = 10^{-5}$ izrišemo graf $R(x)$ z datoteko plotR.m

![IMG_0717](https://github.com/UrosKosmac123/Simulacija-tipala-v-magnetnem-polju/assets/64798766/90913467-0a34-46a7-b953-1345df8a1ec4)


Če izrišemo, še za $L = 0.5$

![IMG_0725](https://github.com/UrosKosmac123/Simulacija-tipala-v-magnetnem-polju/assets/64798766/10f244a4-0468-4a81-9897-9ca717a4dd3d)


vidimo, da je bolje uporabiti krajšo žico. Testni primeri so napisani v datoteki primeri.m ( + še nekaj dodatnih primerov). Poženemo z 
 ```matlab
 h = 0.01;
 H = 0.5;
 L = 0.2;
 L2 = 0.5;
 N = 10;
 B0 = 50;
 r0 = 1;
 lambda = 2;
 epsilon = 1e-5;
 n = 1000;
 a = 4;

>> plotR(h, H, L, N, B0, r0, lambda, epsilon, n, a, "blue")

>> plotR(h, H, L2, N, B0, r0, lambda, epsilon, n, a, "red")
```
($a$ predstavlja dolžino simetričnega intervala).


## Analiza napake polja
Napisano imam tudi funkcijo angles2.m. ki naredi isto kot funkcija angles.m, le bistveno hitreje saj ne potrebuje delati podvojenih izračunov. Temelji pa na predpostavki, da ima magnetno polje $B$ ločljive spremenljivke tj. $B(x,y) = (f_1(x)\cdot g_1(y), f_2(x)\cdot g_2(y))$, za neki funkcije $f_i, g_i$, $i \in \{1, 2\}$. V navodilih naloge je bila napaka in je bilo magnetno polje v obliki
$$B(x,y) =\Big(-\frac{4}{\pi}\sum_{n=1,3,\dots}^\infty \frac{1}{n}e^{-2\pi\frac{y}{\lambda}}\cos(2\pi n\frac{x}{\lambda}), \frac{4}{\pi}\sum_{n=1,3,\dots}^\infty \frac{1}{n}e^{-2\pi \frac{y}{\lambda}}\sin(2\pi n\frac{x}{\lambda})\Big) $$
kjer je eksponentna funkcija neodvisna od $n$, zato lahko zapišemo $B(x,y) = (f_1(x)\cdot g(y), f_2(x)\cdot g(y)) =  g(y)\cdot(f_1(x), f_2(x))$, kjer so 
$$f_1(x) =\Big(-\frac{4}{\pi}\sum_{n=1,3,5,\dots}^\infty \frac{1}{n}\cos(2\pi n\frac{x}{\lambda})\Big)$$
$$f_2(x) =\Big(-\frac{4}{\pi}\sum_{n=1,3,5,\dots}^\infty \frac{1}{n}\sin(2\pi n\frac{x}{\lambda})\Big)$$
$$g(y) = e^{-2\pi\frac{y}{\lambda}}.$$
Če izračunamo skalarni produkt za tak $B$ in za $\vec{j} = (1,0)$, dobimo
$$\cos(\phi) = \frac{B(x,y) \cdot \vec{j}}{||B(x,y)||\cdot ||\vec{j}||} = \frac{g(y)\cdot(f_1(x), f_2(x)) \cdot (1,0)}{||g(y)\cdot(f_1(x), f_2(x))||} = \frac{g(y)\cdot f_1(x)}{||g(y)\cdot(f_1(x), f_2(x))||} =$$
ker je $g$ pozitivna krajšamo
$$=\frac{f_1(x)}{||(f_1(x), f_2(x))||} = f(x).$$
vidimo, da je kot $\phi$ oz. $\cos(\phi) = f(x)$ neodvisna od $y$ koordinate, kar pomeni, da je kot pri vsakem vertikalnem delu žice konstanten, zato je dovolj izaračuna le $N$ kotov (toliko kot je prepogibanj) za vertikalne odseke. Kljub temu, da to ni točen rezultat pa se izkaže, da je precej dober približek. Označimo približek za magnetno polje $\tilde{B}(x,y)$ in pogledamo aboslutno razliko polj (omejimo se le na prvo komponento, druga sledi identično)
$$|B(x,y) - \tilde{B}(x,y)| \leq \frac{4}{\pi}\sum_{n=3, 5, \dots}^\infty \frac{1}{n}|e^{-2\pi n\frac{y}{\lambda}} - e^{-2\pi\frac{y}{\lambda}}|$$
kjer upoštevamo trikotniško neenakost, dejstvo, da je  $|\sin(2\pi n\frac{x}{\lambda})| \leq 1$ in za $n = 1$ se člena pokrajšata v vsoti. Pogledamo izraz z absolutno vrednostjo:
$$|h(y) - h^n(y)| = h(z) |1 - h^{n-1}(y)|, \quad n \geq 3.$$
Tukaj je $h(y) = e^{-\frac{2\pi}{\lambda}y}$. Ker $h$ eksponentno pada, bo $h^{n-1}(z)$ kvečjemu manjši, zato dovolj da analiziramo $h$. Ker hočemo, da je absolutna vrednost, čim manjša nas zanima, kdaj je $h$ čim manjša. Ker je velikost senzorja fiksna se omejimo na $y \in [h, H + h]$. V tem primeru je $h$ zaradi monotonosti največ $e^{-\frac{2h\pi}{\lambda}}$, kar je za dane podatke približno $0.9691$. To je napaka v najslabšem primeru, lahko pa pogledamo še povprečno vrednost funkcije $h$ na tem intervalu tj. $$\text{Avg} = \frac{1}{H} \int_h^{H + h} e^{-\frac{2\pi}{\lambda}y} dy = \frac{\lambda}{2\pi H} e^{-\frac{2h\pi}{\lambda}}(1 - e^{-\frac{2H\pi}{\lambda}}) = 0.4887... $$ (če izračunamo direktno izraz maximalno vrednost in povprečje, dobimo skoraj identične rezultate). Spodaj je izrisan graf za $n = 3, 5, \dots, 29$
![image](https://github.com/UrosKosmac123/Simulacija-tipala-v-magnetnem-polju/assets/64798766/9b54a36b-9330-40c2-b94d-2a7b46616b9b)
Iz grafa je jasno, da je izraz $|h(y) - h^n(y)| < 1$, kar lahko vidimo tudi, če izračunamo limito $n\rightarrow \infty$. Podobno dobimo Avg$(|h(y) - h^n(y)| ) < \frac{1}{2}$. Dobimo $$|B(x,y) - \tilde{B}(x,y)| < \sum_{n=3, 5, \dots}^\infty \frac{1}{n}$$ oz.
$$|B(x,y) - \tilde{B}(x,y)| \approx \frac{1}{2}\sum_{n=3, 5, \dots}^\infty \frac{1}{n}$$ če gledamo povprečje. V vsakem primeru raste razlika zelo počasi, konkretno  raste z hitrostjo $\log(2n-1)$ ko $n$ raste. Iz tega sklepamo, da tudi za dokaj veliko število ćlenov v vsoti, razlika raste zelo počasi, zato je približek dokaj dober, kar je razvidno iz grafa spodaj, kjer so vhodni podatki isti kot v prvem primeru

![IMG_0726](https://github.com/UrosKosmac123/Simulacija-tipala-v-magnetnem-polju/assets/64798766/fba6ac4e-93bc-4c2c-8b4e-56ba75bdc86a)


Če primerjamo z grafom zgoraj je sama vrednost upornost zelo podbna, glavno odstopanje pa je v obliki grafov (spodnji bolj odstopa od željene sinusne oblike)

![IMG_0721](https://github.com/UrosKosmac123/Simulacija-tipala-v-magnetnem-polju/assets/64798766/f5ddcab5-c394-4bd7-b9ae-c8dd1b99e9e3)

(grafa z višjima minimumoma sta približka). To je kar se tiče samih rezultatov, kar pa je prednost približka, pa je čas izručuna. Za izračun in izris celotne upornosti pri pravem polju je okoli $151$ sekund oz. $2$ minuti in $30$ sekund, med tem ko je čas izračuna in izris približnega polja približno $26$ sekund, kar je $5$x hitreje, zato smiselno obravnavati. 
