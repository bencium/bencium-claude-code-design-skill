# Hungarian Humanizer — Teljes patternlista

Mind a 26 AI-pattern példákkal. A SKILL.md 7 kanonikus példát tartalmaz; ez a fájl tartalmazza a többit.

## Tartalomjegyzék

- [Magyar nyelvű AI-patternek (1–12)](#magyar-nyelvű-ai-patternek)
  - [1. Szenvedő/körülíró szerkezetek túlzott használata](#1-szenvedőkörülíró-szerkezetek-túlzott-használata)
  - [2. Nominalizáció és funkcióigés szerkezetek](#2-nominalizáció-és-funkcióigés-szerkezetek)
  - [3. Névmások túlzott használata](#3-névmások-túlzott-használata)
  - [4. Hiányzó partikulák](#4-hiányzó-partikulák)
  - [5. Tükörfordításos szerkezetek](#5-tükörfordításos-szerkezetek)
  - [6. Birtokos szerkezetek halmozása](#6-birtokos-szerkezetek-halmozása)
  - [7. Melléknévhalmozás](#7-melléknévhalmozás)
  - [8. Túl hosszú, többszörösen összetett mondatok](#8-túl-hosszú-többszörösen-összetett-mondatok)
  - [9. amely/amelyek-láncok](#9-amelyamelyek-láncok)
  - [10. Hivataloskodás rossz kontextusban](#10-hivataloskodás-rossz-kontextusban)
  - [11. Az igekötő-szórend és a ragozás kerülése](#11-az-igekötő-szórend-és-a-ragozás-kerülése)
  - [12. Túlzott udvariaskodás](#12-túlzott-udvariaskodás)
- [Univerzális AI-patternek magyarul (13–26)](#univerzális-ai-patternek-magyarul)
  - [13. A jelentőség felnagyítása](#13-a-jelentőség-felnagyítása)
  - [14. Reklámízű nyelv](#14-reklámízű-nyelv)
  - [15. Hízelgő hangnem](#15-hízelgő-hangnem)
  - [16. Túlzott óvatoskodás](#16-túlzott-óvatoskodás)
  - [17. Töltelékszavak és -mondatok](#17-töltelékszavak-és--mondatok)
  - [18. Sablonos lezárás](#18-sablonos-lezárás)
  - [19. Homályos hivatkozások](#19-homályos-hivatkozások)
  - [20. „A nehézségek ellenére” -formula](#20-a-nehézségek-ellenére--formula)
  - [21. Hármas szabály és szinonimakörforgás](#21-hármas-szabály-és-szinonimakörforgás)
  - [22. Határozói igenevek túlzott használata](#22-határozói-igenevek-túlzott-használata)
  - [23. A létige kerülése](#23-a-létige-kerülése)
  - [24. Negatív párhuzam](#24-negatív-párhuzam)
  - [25. Mesterséges skálahivatkozások](#25-mesterséges-skálahivatkozások)
  - [26. Tudásvágás-jellegű felelősségkizárás](#26-tudásvágás-jellegű-felelősségkizárás)
- [Stílusjegyek](#stílusjegyek)
- [Teljes példa](#teljes-példa)

---

## Magyar nyelvű AI-patternek

### 1. Szenvedő/körülíró szerkezetek túlzott használata

A magyarban nincs eleven szenvedő igeragozás. Az AI körülírással pótolja — „megvalósításra kerül”, „-ható/-hető”, „kerül + -ásra/-ésre” —, hogy elkerülje a cselekvő megnevezését. Ettől a szöveg hivataloskodó és élettelen lesz.

Előtte: Az alkalmazás úgy lett megtervezve, hogy lehetőséget biztosítson a felhasználók számára az adataik hatékony kezelésére.
Utána: Az alkalmazással kezeled a saját adataidat.

Előtte: A vizsgálat során megállapításra került, hogy a módszer jobb eredményeket produkál.
Utána: A vizsgálat szerint a módszer jobban működik.

### 2. Nominalizáció és funkcióigés szerkezetek

Az igét főnévvé alakítja, és tesz mellé egy segédigét: „elvégzi az ellenőrzést” ahelyett, hogy „ellenőriz”.

Előtte: A rendszer elvégzi az adatok validálását a mentés végrehajtása előtt.
Utána: A rendszer validálja az adatokat mentés előtt.

Előtte: A csapat elvégzi a projekt előrehaladásának értékelését.
Utána: A csapat értékeli, hogy áll a projekt.

### 3. Névmások túlzott használata

A magyar alanyt elhagyó (pro-drop) nyelv: a személyes névmást kihagyjuk, ha a rag úgyis mutatja. Az AI angol mintára mindenhova kiteszi a „mi”, „ez”, „az” alakokat.

Előtte: Mi úgy gondoljuk, hogy a mi megoldásunk jelentős értéket kínál.
Utána: Megoldásunk értéket teremt.

Előtte: Ez egy olyan eszköz, amely segít neked abban, hogy javítsd a termelékenységedet.
Utána: Az eszköz növeli a termelékenységedet.

### 4. Hiányzó partikulák

Az AI nem használ partikulákat (hát, hiszen, ugye, bizony, is, csak, pedig, azért, -e), mert „informálisnak” tartja őket. Magyarul ezek a normál írott nyelv részei, és irányítják a mondat hangsúlyát.

Előtte: Ez igaz. A helyzet azonban bonyolult.
Utána: Hát igaz. Csak épp bonyolult a helyzet.

Előtte: Próbáld ki ezt. Jól működik.
Utána: Próbáld csak ki. Bizony működik.

### 5. Tükörfordításos szerkezetek

Az AI olyan magyart gyárt, amely az angol szórendet és szerkezeteket követi. Tipikus jele az „Ez az, ami…” kihasító szerkezet az angol „It is X that…” mintájára.

Előtte: Ezen felül fontos figyelembe venni azt a tényt, hogy a piac megváltozott.
Utána: A piac is megváltozott.

Előtte: Éppen ez az a tényező, ami érdekessé teszi a dolgot.
Utána: Épp ettől lesz érdekes a dolog.

### 6. Birtokos szerkezetek halmozása

Egymásra torlódó birtokos szerkezetek, amikor az AI egyetlen szerkezetbe akar zsúfolni egy bonyolult viszonyt. Magyarul ezt igei mondatokra bontjuk.

Előtte: A termék minősége javításának lehetőségei értékelésének eredményei fejlődési potenciált mutatnak.
Utána: Megnéztük, hogyan lehetne javítani a termék minőségén. Van hova fejlődni.

Előtte: A vállalat stratégiai tervezési folyamata megújításának célja a hatékonyság növelése.
Utána: A vállalat megújítja a stratégiai tervezését, hogy hatékonyabb legyen.

### 7. Melléknévhalmozás

Az AI több jelzőt sorol egymás után. Magyarul egy találó jelző többet ér, mint négy általános.

Előtte: A modern, innovatív, felhasználóbarát és sokoldalú platform átfogó megoldásokat kínál.
Utána: Sokoldalú platform, amit könnyű használni.

Előtte: Hatékony, megbízható, skálázható és biztonságos infrastruktúra.
Utána: Megbízható, skálázható infrastruktúra.

### 8. Túl hosszú, többszörösen összetett mondatok

Az AI egyetlen hosszú mondatba pakol több gondolatot, vesszőkkel és kötőszavakkal fűzve. Bontsd külön mondatokra.

Előtte: Az új rendszer, amelyet a múlt hónapban vezettek be, jelentősen javította az ügyfél-elégedettséget, mivel gyorsabb válaszidőt és intuitívabb kezelőfelületet kínál, aminek köszönhetően a felhasználók könnyebben megtalálják a szükséges információt, és hatékonyabban végzik el a feladataikat.
Utána: Az új rendszert a múlt hónapban vezették be. Az ügyfél-elégedettség láthatóan nőtt. A válaszidő gyorsabb, a felület áttekinthetőbb, így könnyebb megtalálni az információt.

### 9. amely/amelyek-láncok

Az AI vonatkozó mellékmondatokat láncol „amely”, „amelyek”, „aki” névmásokkal (a finn joka/jotka megfelelője). Magyarul a jelzős szerkezet vagy a külön mondat természetesebb.

Előtte: A csapat, amely a projektért felel, amely tavaly kapott támogatást, amelyre pályázni kellett, bemutatta az eredményeket.
Utána: A tavaly elnyert támogatásból dolgozó projektcsapat bemutatta az eredményeket.

Előtte: A jelentés, amely azokat az adatokat tartalmazza, amelyeket abból a felmérésből gyűjtöttek, amelyet az ügyfeleknek küldtek ki.
Utána: A jelentés az ügyfeleknek kiküldött felmérés adataira épül.

### 10. Hivataloskodás rossz kontextusban

Az AI hivatalos nyelvet használ oda is, ahova nem való. Az „az adott”, „a fent említett”, „a szóban forgó”, „miszerint” a jogi szövegbe való, nem a blogbejegyzésbe.

Előtte: Az adott termék kiválóan alkalmas a fent említett felhasználási esetek megvalósítására.
Utána: A termék jól működik ezekre a célokra.

Előtte: Amennyiben a felhasználó igénybe kívánja venni a szóban forgó funkciót, elsődlegesen be kell jelentkeznie.
Utána: Jelentkezz be előbb, aztán használhatod a funkciót.

### 11. Az igekötő-szórend és a ragozás kerülése

A magyarban az igekötő tagadásban és fókusz mögött természetesen leválik az igéről („nem csinálom meg”, „meg sem nézte”). Az AI inkább nominalizál és egybeíró, „biztonságos” alakokat választ, hogy elkerülje a leválást és a határozott/határozatlan ragozás finomságait (a finn „astevaihtelun välttely” analógja).

Felismerés: A szöveg feltűnően kerüli a leváló igekötőt és a személyragos igét, helyette főnevesített szerkezetet használ; vagy következetesen a határozatlan ragozásba menekül, ahol a határozott lenne természetes.

Teendő: Nincs automatikus javítás. Add vissza a leváló igekötőt és a személyragos igét, ahol a magyar azt kívánja.

Előtte: A hiba kijavításának elvégzése a fejlesztő feladata.
Utána: A hibát a fejlesztő javítja ki.

### 12. Túlzott udvariaskodás

Az AI az angol udvariassági normákat viszi át a magyarra. A „lenne szíves”, „megköszönném, ha”, a tetszikelés és a nyakatekert kérés magyarul szervilisen vagy egyenesen ironikusan hat.

Előtte: Nagyon hálás lennék, amennyiben szíveskedne megfontolni annak lehetőségét, hogy részt vegyen a rendezvényünkön.
Utána: Szeretettel várunk a rendezvényünkre.

Előtte: Szeretném alázatosan javasolni, hogy esetleg talán újra megvizsgálhatnánk ezt a kérdést.
Utána: Nézzük meg ezt újra.

---

## Univerzális AI-patternek magyarul

Ezek minden nyelvben előfordulnak, de itt magyar példákkal ismerjük fel és javítjuk.

### 13. A jelentőség felnagyítása

Az AI mindent „jelentőssé”, „kulcsfontosságúvá” vagy „döntővé” fúj fel.
Jelzőszavak: jelentős, kulcsfontosságú, döntő, alapvető, létfontosságú, kritikus

Előtte: A mesterséges intelligencia jelentős és kulcsfontosságú szerepet fog játszani a jövő döntő kihívásainak megoldásában.
Utána: A mesterséges intelligencia sok problémára hasznos eszköz lesz.

### 14. Reklámízű nyelv

A szöveg reklámként szól, pedig a kontextus semleges.
Jelzőszavak: egyedülálló, úttörő, forradalmi, páratlan, világszínvonalú

Előtte: Úttörő és egyedülálló platformunk páratlan felhasználói élményt nyújt.
Utána: A platform jól működik, és kilóg a mezőnyből.

### 15. Hízelgő hangnem

Az AI dicséri a kérdezőt vagy a témaválasztást. Magyarul ez különösen kínos.
Jelzőszavak: Remek kérdés!, Feltétlenül!, Teljesen igazad van!, Kiváló észrevétel!

Előtte: Remek kérdés! Ez feltétlenül az egyik legfontosabb téma jelenleg.
Utána: A téma időszerű.

### 16. Túlzott óvatoskodás

Az AI biztos, ami biztos alapon minden állítást tompít.
Jelzőszavak: elképzelhető, hogy esetleg; vélhetően; feltételezhetően; bizonyos mértékben

Előtte: Elképzelhető, hogy ez a megközelítés esetleg bizonyos körülmények között némi javulást eredményezhet.
Utána: A megközelítés valószínűleg javítja az eredményeket.

### 17. Töltelékszavak és -mondatok

Az AI olyan fordulatokkal kezdi vagy tölti a bekezdéseket, amelyek nem visznek tartalmat.
Jelzőszavak: Fontos megjegyezni, hogy; Érdemes kiemelni, hogy; Ebben az összefüggésben; Mint korábban említettük

Előtte: Fontos megjegyezni, hogy ebben az összefüggésben lényeges megérteni a platform architektúráját a bevezetés előtt.
Utána: A bevezetés előtt értsd meg a platform architektúráját.

### 18. Sablonos lezárás

Az AI üres derűlátással zárja a szöveget.
Jelzőszavak: A jövő fényesnek ígérkezik; tovább fejlődik; új lehetőségeket nyit

Előtte: A jövő fényesnek ígérkezik, és a szakterület tovább fejlődik, új lehetőségeket nyitva minden szereplő számára.
Utána: [Töröld, vagy cseréld konkrét előrejelzésre]

### 19. Homályos hivatkozások

Az AI tekintélyekre hivatkozik, de nem nevezi meg őket.
Jelzőszavak: Szakértők szerint; Kutatások bizonyítják; Az iparág vezető szereplői

Előtte: Kutatások bizonyítják, hogy a szakértők szerint ez a szakma legjobb gyakorlata.
Utána: [Nevezd meg a forrást] vagy töröld az állítást.

### 20. „A nehézségek ellenére” -formula

Az AI elismer egy nehézséget, majd rögtön el is söpri. Szerkezet: „bár X, mégis Y”.
Jelzőszavak: A kihívások ellenére; Bár [probléma], tovább fejlődik

Előtte: A kihívások ellenére a vállalat növelte a piaci részesedését, és erős fejlődést mutat tovább.
Utána: A vállalat növelte a piaci részesedését. Nehézség is akad: [nevezd meg].

### 21. Hármas szabály és szinonimakörforgás

Az AI hármas csoportokba szedi a dolgokat, és szinonimákat forgat, hogy elkerülje az ismétlést. Magyarul az ismétlés természetes.

Előtte: A megoldás hatékony, eredményes és hasznos. Javítja, fejleszti és optimalizálja a folyamatokat.
Utána: A megoldás hatékony. Javítja a folyamatokat.

Előtte: A platform összekapcsolja, integrálja és egyesíti a különböző adatforrásokat.
Utána: A platform összekapcsolja a különböző adatforrásokat.

### 22. Határozói igenevek túlzott használata

Az AI túlhasználja a -va/-ve és a -ván/-vén alakokat konkrétabb ige helyett (a finn -malla/-mällä analógja).

Előtte: Az új technológiák kihasználásával és a meglévő folyamatok áttekintésével jelentős javulás érhető el.
Utána: Az új technológiákkal és a folyamatok áttekintésével javíthatunk az eredményeken.

Előtte: A felhasználók igényeit figyelembe véve és a használati adatokat elemezve jobb megoldások fejleszthetők.
Utána: A felhasználók igényei és a használati adatok alakítják a fejlesztést.

### 23. A létige kerülése

Az AI kerüli az egyszerű „van/lenni” igét, és bonyolultabbra cseréli: „működik”, „jelent”, „képvisel”, „biztosít”. (A magyar egyes szám harmadik személyben elhagyja a létigét — „a platform jó” —, ezt tartsd meg.)

Előtte: A platform kulcsfontosságú eszközként működik az adatkezelésben, és sokoldalú lehetőségeket biztosít.
Utána: A platform jó eszköz az adatkezeléshez.

Előtte: Ez a megoldás modern megközelítést képvisel, és alapot jelent a jövőbeli fejlesztéshez.
Utána: Ez modern megoldás, amire később építeni lehet.

### 24. Negatív párhuzam

A „nemcsak… hanem… is” szerkezet túlhasználata nyomatékként.

Előtte: A platform nemcsak hatékonyabbá teszi a munkát, hanem a csapatok együttműködését is javítja.
Utána: A platform hatékonyabbá teszi a munkát, és javítja az együttműködést.

Előtte: A megoldás nemcsak időt takarít meg, hanem új szempontokat is ad a döntéshez.
Utána: A megoldás időt takarít meg, és új szempontokat ad a döntéshez.

### 25. Mesterséges skálahivatkozások

A „valamitől valameddig” szerkezet hamis teljességet sugall. Az AI azért használja, hogy átfogónak tűnjön.

Előtte: A platform mindent lefed a stratégiai tervezéstől az operatív megvalósításig.
Utána: A platform a tervezést és a megvalósítást is támogatja.

Előtte: A szolgáltatás a legapróbb részletektől a nagy egészig mindenben segít.
Utána: A szolgáltatás különböző méretű feladatokban segít.

### 26. Tudásvágás-jellegű felelősségkizárás

Az AI felesleges kitételeket fűz a saját tudásszintjéről.
Jelzőszavak: legfrissebb ismereteim szerint; a rendelkezésre álló adatok alapján; jelenlegi tudásom szerint

Előtte: Legfrissebb ismereteim szerint a piaci helyzet jelentősen megváltozott az elmúlt években.
Utána: A piaci helyzet megváltozott az elmúlt években.

Előtte: A rendelkezésre álló adatok alapján megállapítható, hogy a fejlődés pozitív volt.
Utána: A fejlődés pozitív volt.

---

## Stílusjegyek

Ezek nem patternek, hanem formázási szokások, amelyeket az AI kedvel:

- **A félkövér túlzott használata** — Az AI minden kulcsszót kiemel. Csak azt szedd félkövérre, ami tényleg figyelmet kíván.
- **Emojik** — Töröld, ha a kontextus nem egyértelműen informális (közösségi média, chat).
- **„Címke:” -szerű felsorolás** — Az AI így ír: „**Előny:** jobb teljesítmény”, pedig mondhatná: „A teljesítmény javul”.
- **Idézőjelek** — Magyarul a helyes forma a „macskaköröm”: alul nyitó („, U+201E), felül záró (”, U+201D). Nem az egyenes "…", és nem az angol “…” (magas nyitó, magas záró). A belső idézet a »lúdláb«. (Ez eltér a finn szabálytól, amely egyenes idézőjelet ír elő — ne másold át a finn megoldást.)

---

## Teljes példa

### Előtte (AI-generált)

> **Átfogó áttekintés a modern szoftverfejlesztésről**
>
> A mai szoftverfejlesztés jelentős és kulcsfontosságú része a digitális átalakulásnak. Fontos megjegyezni, hogy a szakterület fejlődése rendkívül gyors volt az elmúlt években. Mi úgy látjuk, hogy az új technológiák, az innovatív eszközök és a hatékony módszerek megváltoztatták azt, ahogyan a szoftvereket tervezik, fejlesztik és karbantartják.
>
> Az agilis módszerek, amelyek széles körű elfogadottságra tettek szert, jelentős előnyöket kínálnak a hagyományos megközelítésekhez képest. Az adott módszerek segítségével a csapatok gyorsabb reagálást tudnak végrehajtani a változó követelményekre. Kutatások bizonyítják, hogy az agilis fejlesztést kihasználó szervezetek jobb eredményeket érnek el az ügyfél-elégedettség, a termelékenység és a minőség terén.
>
> A kihívások ellenére a szakterület tovább mutat erős fejlődést. A mesterséges intelligencia döntő szerepet fog játszani a szoftverfejlesztés jövőjének formálásában. A jövő fényesnek ígérkezik, és új, izgalmas lehetőségeket nyit minden szereplő számára.

### Utána (természetessé téve)

> A szoftverfejlesztés gyorsan megváltozott. Az új eszközök és módszerek átformálták az egész szakmát — a tervezéstől a karbantartásig.
>
> Az agilis módszerek nem véletlenül terjedtek el. A csapatok gyorsabban reagálnak a változó követelményekre. A State of Agile 2024-es jelentése szerint például az agilist használó szervezetek jobb ügyfél-elégedettségről és minőségről számolnak be.
>
> A mesterséges intelligencia is alakítja a szakmát, de hogy pontosan hogyan és milyen gyorsan — azt még nem tudni.

### Elvégzett módosítások

| # | Pattern | Módosítás |
|---|---------|-----------|
| 1 | Szenvedő/körülíró | „reagálást tudnak végrehajtani” → „reagálnak” |
| 2 | Nominalizáció | „reagálást tudnak végrehajtani” → „reagálnak” |
| 3 | Névmások túlzott használata | „Mi úgy látjuk, hogy” → törölve |
| 5 | Tükörfordítás | „azt, ahogyan” → „a tervezéstől a karbantartásig” |
| 7 | Melléknévhalmozás | „új technológiák, innovatív eszközök és hatékony módszerek” → „új eszközök és módszerek” |
| 8 | Túl hosszú mondatok | Az első bekezdés feldarabolva |
| 9 | amely/amelyek-láncok | „amelyek széles körű elfogadottságra tettek szert” → „elterjedtek” |
| 10 | Hivataloskodás | „Az adott módszerek segítségével” → törölve |
| 13 | Jelentőség felnagyítása | „jelentős és kulcsfontosságú” → törölve |
| 17 | Töltelékszavak | „Fontos megjegyezni, hogy” → törölve |
| 18 | Sablonos lezárás | „A jövő fényesnek ígérkezik” → őszinte bizonytalanság |
| 19 | Homályos hivatkozás | „Kutatások bizonyítják” → megnevezett forrás |
| 20 | „A nehézségek ellenére” | A formula törölve, a nehézség nyitva hagyva |
| 21 | Hármas szabály | A hármas csoportok megritkítva |
