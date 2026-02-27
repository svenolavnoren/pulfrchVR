# DEV_NOTES – pulfrichVR

Den här filen är för oss som bygger pulfrichVR. Kort, rak och utan sirap.

## Syfte

- pulfrichVR ska ta **färdigbalanserat equirect-material** (video eller stillbild)  
  → hjälpa användaren att välja bra vänster/höger-rutor  
  → skapa **högkvalitativa 3D-360 stillbilder** för VR-headset.

- Hemmaplan:  
  **“equirect in → 3D360-stillbild ut”**, oberoende av kamera och headset, så länge inputen är vettig kvalitet.

## Målbild / känsla

- Resultatet ska ge **“jag står där”-känsla**, inte “jaha, lite platt skitstereo”.
- Vardagsögonblick (kompisar, resor, platser) ska bli **rum man vill återvända till** i headsetet.
- Efter första försöket ska användaren känna:  
  *“Det här vill jag testa igen”*, inte *“aldrig mer”*.

## Målgrupp

- Personer som har:
  - 360-kamera (t.ex. Insta360)
  - VR-headset (t.ex. Quest 3)
  - Lite teknikintresse men **ingen lust** att lära sig ffmpeg, färgrymder eller filformat.

- Appen ska fungera både för:
  - “tisdagspersonen” som bara trycker på uppenbara knappar.
  - detaljnörden som vill pilla på yaw, utsnitt och stereo-offset.

## Teknisk inriktning

- Minimera **generationsförlust** (särskilt i färg/krominans):
  - Genomtänkt RGB/YUV-kedja.
  - Så få omkodningar som möjligt.

- Tänk “negativ”:
  - Alla viktiga val (frames, parametrar) ska gå att återskapa via bat-filer och filnamn.
  - Man ska kunna framkalla om samma bild senare och få samma resultat.

- Kameraneutral / headsetneutral:
  - Så länge input är equirect i rimlig upplösning ska flödet fungera.

- Gör få saker **väldigt bra**:
  - välja bra rutor
  - matcha vänster/höger robust
  - hantera utsnitt / yaw / stereo-offset
  - skriva ut bilder i format headseten gillar

## Användarflöde (1.0, grovt)

1. Välj equirect-källa (video/stillbild).
2. Stega i videon, hitta ett ögonblick, välj vänster/höger.
3. Tryck E → appen skapar bat-fil(er) = “negativ”.
4. 360 bat runner framkallar jpg-bilder när som helst utifrån dessa negativ.
5. Användaren skickar bilderna till sitt headset (externt steg, t.ex. Quest 3 + Skybox).

## Kvalitet och trygghet

- **Konsekventa filnamn och mappar**:
  - En människa ska i efterhand kunna se “vad som hänt”.
  - Koden ska kunna hitta och framkalla utan specialfall.

- **Deterministiskt**:
  - Samma input + samma val → samma output.

- **Trygga standardlägen**:
  - Utan att ändra en enda inställning ska man få **bra stereo**.
  - Reglage som lätt ger skitstereo ska:
    - ha rimliga begränsningar, eller
    - vara tydligt markerade som “avancerat”.

## Kodmål

- Minska **logikduplicering** och spridda specialfall:
  - så att vi vågar ändra saker utan att få dolda bieffekter.
  - så att det blir enklare att lägga till nya källtyper (t.ex. insv) utan spagetti.

- Tydlig separation mellan:
  - **vad** vi gör (modell/pipeline, filnamnslogik, regler)
  - **hur** vi visar det (UI, knappar, listor).

- Paketering:
  - Windows: .zip + .bat, inga kompileringar för användaren.
  - Ska fortsätta fungera hyggligt under Wine/Linux.

## Avgränsningar för 1.0

- pulfrichVR ska **inte** bli:
  - full videoredigerare
  - färggraderingsverktyg
  - komplett insv-lab eller dubbla kamerariggar.

- Sådant är **lekplats / bonus**, inte krav för att kalla det 1.0.

- För 1.0 är det viktigare att:
  - stillbildsflödet är **robust och begripligt**
  - än att alla drömidéer finns med.

## Framgångskriterier (1.0 “Roland-testet”)

- Några externa testare (t.ex. Roland m.fl.) kan:
  - installera appen
  - använda **eget** equirect-material
  - skapa flera 3D-360-bilder utan att ha dig bredvid.

- De:
  - får minst en tydlig *“wow, där står jag ju”*-upplevelse
  - vill fortsätta använda verktyget på eget initiativ.
