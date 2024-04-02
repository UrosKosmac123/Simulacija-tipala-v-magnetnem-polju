## Kratko poročilo

- Problem: Dan imamo AMR senzor v obliki žice. Žica je dana z podatki $N$ (število prepogibanj žice), $H$ (dolžina žice), $L$ (dolžina žice).
         Zanima nas celotna upornost žice v magnetnem polju $B$, ki je podano z 
         $$B(x,y) =\Big(-\frac{4}{\pi}\sum_{n=1,3,\dots}^\infty \frac{1}{n}e^{-2\pi n \frac{y}{\lambda}}\cos(2\pi n\frac{x}{\lambda}), \frac{4}{\pi}\sum_{n=1,3,\dots}^\infty \frac{1}{n}e^{-2\pi n \frac{y}{\lambda}}\sin(2\pi n\frac{x}{\lambda})\Big) $$

- Pristop: Celotna upornost je dana kot integral 
         $$R(x) = \int r(x) dl, $$ kjer je $r(x)$ upornost dana v koordinat $x$ ($y$ je že določen) in $dl$ majhen del žice. Sama upornost $r$ pa je dana kot $r(\phi(x)) = r_0 (1 + 0.02\cdot \cos^2(\phi(x)))$, kjer je $\phi$ kot med tokovno gostoto $j$ v žici in tokom magnetnega polja $B(x,y)$. Naredil bom sledeče: napisal funkcij za izračun magnetne polja $B(x,y)$ (in za računanje neskončnih vsot do neke natančnosti $\epsilon$) in za izračun kota med $B$ in $j$ preko skalarnega produkta $$\phi = \frac{B(x,y) \cdot j}{||B(x,y)||\\,\\,||j||}.$$
Nato bom generiral točke žice oz. razdelil žico na zelo kratke razdalje, in izračunal upor v vsaki točki in nato seštel vse te (oz. po integriral)
- Okolje: delal bom v Matlabu, brez kakršnih koli posebnih knižnjic.

![image](https://github.com/UrosKosmac123/Simulacija-tipala-v-magnetnem-polju/assets/64798766/ce3ac5a4-6902-4579-aa86-a713d89d01bb)

