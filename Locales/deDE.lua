local fr = CreateFrame("Frame")
fr:RegisterEvent("ADDON_LOADED")

function fr:OnEvent(event,...)
	local arg1 = ...
	if event =="ADDON_LOADED" and arg1 == "RobBossMods" then
		local L
		if rbm_elang == "de" and GetLocale() == "enUS" then
			L = LibStub("AceLocale-3.0"):NewLocale("RobBossMods", "enUS", false)
		else
			L = LibStub("AceLocale-3.0"):NewLocale("RobBossMods", "deDE", false)
		end
		if not L then return end

	-- bosses with their ids as key


--menu entrys
L["AUTHOR1"] = "Autor ist Robert Hartmann, Deutschland ( Justicia auf EU-die silberne Hand und Lest\195\161 auf dem gleichen Server) Email: robert@keinerspieltmitmir.de"
L["AUTHOR2"] = "Gehilfen f\195\188r die englische \195\156bersetzung: Stagen@irc.freenode.net und Niadyth@irc.freenode.net"
L["BOSS_DEAD1"] = " ist tot."
L["BOSS_DEAD2"] = " ist als N\195\164chstes dran."
L["CHOICE"] = "Auswahl"
L["CURRENTBOSS"] = "aktueller Boss"
L["DONTKNOW"] = "Hallo. Ich habe die 'RobBossMods' f\195\188r heroische Instanzen installiert. Vor jedem Boss k\195\182nnt ihr !boss eingeben und ihr erhaltet eine Erkl\195\164rung!"
L["DONTKNOW_OLD"] = "Wer den Boss nicht kennt, gibt bitte !boss in den Gruppenchat ein und bekommt eine Erkl\195\164rung."
L["DRAG"] = "Shift + Links-Klick: Minimap Symbol verschieben"
L["EVERY_BOSS_ANNOUNCE"] = "Hinweis beim Anvisieren"
L["EVERY_BOSS_ANNOUNCE_DESC"] = "Wenn ein Boss anvisiert wird, im Gruppenchat den Hinweis geben, dass man mit !boss die Taktik erfragen kann!"
L["GUILD"] = "Gilde"
L["INFORM_PARTY"] = "Hinweis an Gruppe senden"
L["LASTBOSS"] = " war der letzte Boss hier. Vielen Dank f\195\188r die Gruppe!"
L["LEFTCLICK"] = "Links-Klick: Taktiken senden an.."
L["MENU_AUTHOR"] = " /rbm autor -- Informationen \195\188ber den Autor abrufen"
L["MENU_DESCRIPTION"] = "RobBossMods zeigt Boss Taktiken f\195\188r Heroische Instanzen an. Wenn du in einer Instanz bist, k\195\182nnen Spieler mit !boss im Gruppenchat die Taktik abfragen. Du kannst die taktiken au\195\159erdem manuell senden und die Bosse ebenso manuell ausw\195\164hlen!"
L["MENU_GENERAL"] = "Allgemeine Einstellungen"
L["MENU_HINT1"] = " !rbminfo im Gruppenchat .-- Gibt Informationen \195\188ber das Addon. U.a. Link und Namen."
L["MENU_MINIMAP_OFF"] = " /rbm minioff -- Verstecke Minimap Icon"
L["MENU_MINIMAP_ON"] = " /rbm minion -- Zeige Minimap Icon"
L["MENU_RESETLANG"] = " /rbm resetlang -- Spracheinstellungen zur\195\188cksetzen"
L["MENU_STATE"] = " /rbm status -- gibt den Status des Addons zur\195\188ck"
L["MINIMAP_SHOW"] = "Zeige Minimap Symbol"
L["MYSELF"] = "Mich"
L["NEW_VER1"] = "Du hast RBM Version "
L["NEW_VER2"] = " installiert, aber es gibt bereist Version: "
L["NEXT_BOSS_ANNOUNCE"] = "n\195\164chsten Boss ansagen"
L["NEXT_BOSS_ANNOUNCE_DESC"] = "Wenn der Boss stirbt, im Gruppenchat ansagen und sagen wer der n\195\164chste ist!"
L["NOBOSS"] = "Kein Boss ausgew\195\164hlt!"
L["NONE"] = "keiner"
L["OPTIONS"] = "Optionen"
L["PARTY"] = "Gruppe"
L["POSTON"] = "Senden an..."
L["RESET_CUSTOM"] = "L\195\182schen eigener Taktiken"
L["RESET_CUSTOM_DESC"] = "Eigene Beschreibungen zur\195\188cksetzen und Voreinstellung laden. Achtung ALLE eigenen Taktiken werden gel\195\182scht!"
L["RIGHTCLICK"] = "Rechts-Klick: manuell Boss einstellen"
L["SAY"] = "Sagen"
L["S_GHUR"] = "Ghur'sha ist tot. Ozumat ist als N\195\164chstes dran!"
L["S_HELIX"] = "Helix ist tot. Feindschnitter 5000 ist als N\195\164chstes dran!"
L["S_OZUMAT"] = "Ozumat war der letzte Boss hier. Vielen Dank f\195\188r die Gruppe"
L["T3887"] = "Einfacher Kampf. Ab und zu kommen Worgen. Mittanken und umhauen. Entfluchen nicht vergessen."
L["T39378"] = "SPELL(80352): Unbedingt unterbrechen!\
SPELL(87653): Er visiert einen Spieler an. Unter diesem wird der Boden dunkel. Sofort rauslaufen, da der Boss gleich dort hin springt und Aua macht!\
Ab und zu rennt er in die Mitte und macht einen AE, dann gegenheilen. Au\195\159erdem sind \195\188berall kleine Feuertornados, ausweichen!!"
L["T39425"] = "Blaue Flecken, SPELL(75117),  auf dem Boden: rauslaufen!\
SPELL(74938): Ist dieses Aktiv sollte die Gruppe sich aufteilen. Ein Teil geht links und der andere rechts zum Hebel. Je einer lenkt die Schlangen ab und der andere macht den Hebel.\
Danach wird sich oben gesammelt, schnell die Schlangen get\195\182tet  (machen fiesen Giftdebuff, nicht dispellbar) und dann der Boss, der SPELL(75322) zaubert, unterbrochen."
L["T39428"] = "Phase 1: normaler Kampf. Aus dem braunen-grauen Kreisen aus dem Boden raus.\
Phase 2: Boss ist vergraben. adds kommen. Tanken und t\195\182ten das wars. "
L["T39732"] = "Setesh ist nicht tankbar. Der Tank sammelt alle adds ein und kitet sie so gut wie m\195\182glich. Achtung! Boss macht kleine Kreise und grosse Schattenkreise, raus da!\
Setesh l\195\164uft zu einer Ecke und l\195\164sst ein Portal erscheinen. Dieses Muss extrem schnell genuked werden, damit maximal 1 Add und 2 W\195\188rmer austreten. Der Tank sammelt diese ein.\
Die Gruppe macht konsequent Schaden auf den Boss. Achtung er castet kleine AE Kreise zwischendurch, da sofort raus!"
L["T39625"] = "SPELL(90250): Er visiert einen Spieler an und chargt ein paar Sekunden sp\195\164ter an. Weglaufen ist hier die Devise\
SPELL(90249): Er verursacht extremen Schaden direkt vor ihm. Kurze Reichweite. Melee und Tank geht hinter den Boss.\
SPELL(91937): Debuff auf dem Tank, der viel Schaden verursacht ( DOT ). Geht nur weg wenn 90% oder mehr vom Tank geheilt wurde. UNBEDINGT vollheilen!\
Trogs: Unter den Trogs die erscheinen ist ein Kranker. Ein Ranged DD sollte ihn rausziehen und abseits t\195\182ten.\
Der kranke Trogg darf nicht in der N\195\164he eines Spielers oder des Bosses oder anderer NPC sterben, sonst SPELL(90169)."
L["T39665"] = "SPELL(75272): Kreaturen spawnen unter euch. Lauft einen Schritt zur Seite und versucht die adds beim tank abzuladen.\
SPELL(75539): Alle werden zum Boss geportet und wir m\195\188ssen sofort die Ketten zerst\195\182ren. Danach sofort alle von ihm weg rennen, da er SPELL(93453) castet der dich sonst t\195\182tet."
L["T39679"] = "Es werden 3 Strahlen SPELL(75610) auf die Adds geworfen. Es muss je einer der Gruppe in je einen Strahl, damit dieser nicht permanent auf dem Add ist.\
Der Strahl verursacht einen Debuff, der stackt. Wenn der Stack bei 80 ist, lauft Ihr raus aus dem Strahl, lasst den Debuff austicken und geht wieder rein.\
Tank und Melee kicken SPELL(93462), da dieser sonst einen Wipe verursachen kann."
L["T39698"] = "Alle versammeln sich innerhalb des Kreises, sodass sie nicht auf dem Gitter stehen.\
Karsh ist quasi immun gegen alle Attacken. Um ihn angreifbar zu machen muss der Tank ihn in die Mitte ziehen.\
Dadurch erh\195\164llt Karsh einen Debuff SPELL(75846) der ihn angreifbar macht. Tickt der Debuff aus kommen Ads.\
Ziel ist es, den Debuff immer aufrecht zu erhalten, indem man Karsh kurz bevor der Debuff austickt, kurz in die Mitte zieht."
L["T39700"] = "(normal) Wenn die Adds nicht CC werden k\195\182nnen m\195\188ssen sie zuerst get\195\182tet werden, da sie SPELL(93666) und SPELL(93667) verursachen, was stark an der Heilung nagt.\
Ansonsten ist es normales Tank und Spank Wenn Ihr das hintere Hund-Add t\195\182tet, dann bekommt der Boss einen Wutanfall.\
Furchtschutz und Erdsto\195\159totem helfen gegen das Fear. Aus dem Feuer rauslaufen."
L["T39705"] = "Jemand sollte die 3 Adds kiten, da sie SPELL(76189) verursachen. Der Boss selbst kann nicht viel. Nach einer Weile tauscht er mit einem Add den Platz.\
Der Tank muss dann schnell wieder den Lord rausziehen und die restlichen 3 adds werden weiter gekitet."
L["T39731"] = "Boss wird normal getankt. DDs gehen immer SOFORT auf die kleinen gr\195\188nen Knospen die er auf den Boden plaziert.\
Wenn eine Spore erscheint, muss der Tank diese unverz\195\188glich an sich binden und t\195\182ten, sodass der Boss danach in SPELL(75701) steht, der Tank aber nicht.\
Dieser Kampf kann sehr lange dauern, wenn der Boss nicht richtig in die Sporen gestellt wird. Er heilt sich sonst n\195\164mlich deutlich hoch!"
L["T39587"] = "SPELL(74136): \195\164hnlich wie PDC-Eric. Einfach abwenden/umdrehen, wenn sie das castet.\
Split: Sie teilt sich bei 66% in 3 und bei 33% in 2 Kopien ihrer selbst. Jede dieser Kopie hat eine Eigenschaft. T\195\182tet eine Kopie. Die Eigenschaft dieser verschwindet von dem Boss aber verst\195\164rkt die anderen."
L["T39788"] = "SPELL(76184): schwarze Kreise auf dem Boden, die nicht mehr verschwinden: sofort raus!\
SPELL(91208): AOE. Einfach gegenheilen."
L["T40177"] = "SPELL(74984): Throngus l\195\164sst kleine AE Kreise entstehen (sehen aus wie Weihe) dort nicht stehen!\
Waffenwahl: 2 Schwerter -> Tank bekommt einen Magiedebuff der viel Schaden verursacht. Dieser MUSS gedispellt werden\
Waffenwahl: SPELL(75007) -> Tank muss Boss kiten. Thronugs wirkt SPELL(90756). Der betroffene Spieler muss ein wenig geheilt werden\
Waffenwahl: Schild -> ALLE hinter den Boss. Am besten direkt dran, denn er dreht sich in der Phase gern mal, dann kann man schnell hinter her."
L["T40319"] = "Phase 1: Er beschw\195\182rt Feuerelementare SPELL(75218), die einen verfolgen. Der Verfolgte rennt weg, alle anderen DDs schwenken um auf das Ad!\
Phase 2: Wie Phase 1 + Tank muss aus Suppe vom Drachen gehen und Range DDs sollten Max Range einhalten zum Boss, da dieser SPELL(90950) wirkt, der mehr Schaden verursacht je n\195\164her man dran steht."
L["T40484"] = "SPELL(91081): Er macht einen Kreis auf dem Boden, einfach raus gehen.\
SPELL(91086): Er macht wieder einen Kreis auf dem Boden, castet aber diesmal lange. Alle m\195\188ssen schnell IN den Kreis, sonst bekommen sie Schaden! Danach wieder verteilen.\
Adds: Nach jedem Schattenorkan kommen 2 Ads. Teilt euch auf, denn diese adds m\195\188ssen so schnell wie m\195\182glich down gehen. Sonst heilt sich der Boss wieder voll und es kommen kleine Ads."
L["T40586"] = "SPELL(75722): Blauer Kreis auf dem Boden. Raus da!\
Blaue Wirbelst\195\188rme: Nicht davon erfassen lassen! In Bewegung bleiben sonst ist man bewegugnsunf\195\164hig und bekommt recht viel Schaden.\
SPELL(91477): 2 Sekunden Zauber. Unbedingt unterbrechen.\
PHASE 2 (immer bei 66% und 33%) Sie beschw\195\182rt zwei Naga Hexen (wenn m\195\182glich eine oder beide CC ) und einen dicken Naga. Den dicken entweder Kiten und erst die Adds umhauen oder Hexen CC und Dicken umhauen."
L["T40765"] = "SPELL(76047): Verursacht am Einschlagsort Schaden und es \195\182ffnet sich ein Riss. Dieser Riss w\195\164chst stetig, daher muss der Boss gezogen werden (am besten am Rand im Kreis).\
SPELL(91484): Er nimmt eine zuf\195\164lliges Gruppenmitglied und f\195\188gt ihm 6 Sekunden lang Schaden zu. Einfach gegenheilen.\
SPELL(76100): Ab und zu wird der Boss w\195\188tend. Versuchen runterzunehmen wenn m\195\182glich ansonsten gegenheilen."
L["T40792"] = "Phase 1: Die zaubernden Gesichtslosen schnell t\195\182ten. Tank schnappt sich den Dicken. Die kleinen Murlocs regelm\195\164\195\159ig bomben.\
Phase 2: DDs k\195\188mmern sich komplett um die 3 zaubernden Gesichtslosen. Tank kitet die Schattengestalten. Wichtig! nicht ber\195\188hren lassen und aus den schwarzen Pf\195\188tzen raus.\
Phase 3: Alle werden mega gross und machen mega DMG! sofort die Kracke anvisieren /tar ozumat und full dmg alles z\195\188nden was geht :)."
L["T40825"] = "Der Boss mus mit R\195\188cken zur Gruppe getankt werden. Er castet ab und zu SPELL(76170), was dann nur den Tank trifft. Danach castet er sofort SPELL(91412). Unterbrechen!\
Aus den roten Pf\195\188tzen raus gehen. Bei 50% hebt sich das die Brain Qualle - Geistbeuger Ghur'sha - sucht sich einen neuen Wirt.\
SPELL(76234): Gr\195\188ne Pf\195\188tzen. Raus da sonst k\195\182nnt ihr nicht zaubern/angreifen.\
SPELL(91492): Immer wenn man Ghur'sha jetzt angreift, heilt sie sich und f\195\188gt uns Schaden zu, daher: Reinigen, Buff klauen oder mit Hunter runternehmen. Geht das alles nicht: DMG stop!"
L["T42188"] = "Allgemeines: Ozruk wird mit R\195\188cken zur Gruppe getankt.SPELL(92659) und SPELL(92429) reflektieren Zauber.\
SPELL(92410): Er haut vor sich auf dem Boden. 8 Meter um diese Einschlagsstelle bekommt man massiven Schaden. Melee und Tank soweit wie m\195\182glich hinter dem Boss!\
SPELL(92662): Kommt IMMER nach SPELL(92426). Ranged bleibt auf Maxrange. Melee und Tank laufen sofort mind. 15 meter/yards weg!"
L["T42333"] = "SPELL(79351) (meistens auf Tank): Unterbrechen! Der macht viel DMG.\
SPELL(79340): Sie castet schwarze Kreise. Raus da und versuchen so dahinter zu stehen, dass die adds da reinlaufen und sterben.\
SPELL(79002): Sie wirft mit Felsen, kann man aber leicht auf dem Boden erkennen, einfach raus da.\
SPELL(92663): Fluch der erlittenen Schaden erh\195\182ht. Unbedingt entfluchen!"
L["T4278"] = "Tank muss immer aus SPELL(93687) raus und SEHR schnell reagieren, wenn die 2 adds kommen sofort an sich binden und umhauen.\
Alternativ: Umnuken und 2 Adds CCen, weitere Adds nur an sich binden und weiter Boss nuken! Die Adds wirken SPELL(93844) auf den Boss.\
3. Methode: alles bis zum Boss cleraen, der Tank pullt den Boss und rennt dann runter zum Hof. Dort werden keine Ads mehr spawnen und man hat mehr Platz."
L["T43214"] = "Phase 1: Er ist am Boden. Heiler und Tank m\195\188ssen in einer Linie sein damit geheilt werden kann. Wenn der Boss SPELL(92265) castet alle hinter die Steine!\
Phase 2: Er ist in der Luft. Einfach den schwarzen Kreisen ausweichen. Ausserdem in beiden Phasen aus dem roten Zeug raus!"
L["T43438"] = "Phase 1: Er castet rosa Splitter auf dem Boden SPELL(86881). Sofort RAUS da und sofort (noch w\195\164hrend er castet) AOE drauf, die Splitter die schl\195\188pfen explodieren beim sterben.\
Phase 2: Boss is vergraben. Aus den Streifen auf dem Boden raus und adds tanken und bomben."
L["T43612"] = "Phase 1: Boss wird getankt und es ist darauf zu achten sofort aus den Lichts\195\164ulen zu gehen. Es erscheint au\195\159erdem ein Ph\195\182nix.\
Ziel ist es den Ph\195\182nix schnell zu t\195\182ten, dann wird dieser zum Ei. Das Ei kann nicht zerst\195\182rt werden und erh\195\164llt immer mehr HP bis es voll ist und der Ph\195\182nix schl\195\188pft.\
W\195\164hrend der Ph\195\182nix ein Ei ist k\195\182nnt ihr also Barim attackieren. Bei 50% kommt ihr in Phase 2.\
Phase 2: Boss ist nicht angreifbar. Raus aus SPELL(88814) das den Boss umgibt. Ein dunkler Ph\195\182nix erscheint, der sofort get\195\182tet werden muss. Erreichen Seelensplitter den Ph\195\182nix haut dieser mehr rein.\
Sobald der dunkle Ph\195\182nix tot ist, geht es mit Phase 1 weiter."
L["T43614"] = "SPELL(81642): Der Boss schmettert regelm\195\164\195\159ig mit seinem Schwanz auf dem Boden. Raus dort!\
SPELL(89998): zuf\195\164lliger Spieler bekommt Debuff und kleine Krokos greifen diesen an. Nicht tankbar. Adds verursachen starken Debuff (Dot) und m\195\188ssen daher schnell get\195\182tet werden.\
Autsch: Ab und zu kommt Autsch und wirbelt ein bisschen rum. Melee und Tank einfach weg vom Wirbler (der nach diesem Kampf sofort erscheint)\
SPELL(81706): Ab 30% wird der Boss w\195\188tend und verursacht mehr DMG. Heldentum/Zeitkr\195\188mmung und Tank CDs z\195\188nden!"
L["T43778"] = "Add: Einer muss mit einer Erntemaschine die adds kontrollieren. Diese spawnen unten an den Schmelzen. Ziel: 2x SPELL(91734) 1xSPELL(91735), damit die adds nicht bis zur Treppe kommen.\
Der Boss selbst wird an/auf der Treppe getankt, damit der Ad Spieler unten genug Platz hat und der Rest der Gruppe keinen Schaden bekommt.\
SPELL(88481): Boss dreht durch und f\195\188gt Spielern in seiner N\195\164he schaden zu. DDs rennen weg. Tank spottet kurz danach.\
SPELL(88495): Boss visiert einen Spieler an und rennt zu ihm. Dieser Spieler rennt weg, NACHDEM unter ihm der rote Kreis entstanden ist.\
Bei 30% verursacht der Boss SPELL(88495): Heldentum/Zeitkr\195\188mmung/Blutrausch und Tank CDs z\195\188nden!"
L["T43873"] = "Wirbelst\195\188rme: Der ganze Platz wird von kleinen Wirbelst\195\188rmen ausgef\195\188llt, die sich geringf\195\188gig bewegen. Ausweichen!\
Wind von Altairus: Der Boss l\195\164sst einen Wind entstehen der in eine Richtung fegt. (Sieht man besser wenn Kamera schr\195\164ger steht). DDs stehen so, dass sie mit dem Wind stehen. Tank umgekehrt.\
SPELL(93989): Der Boss dreht sich zu einem zuf\195\164lligen Spieler und spuckt ihn kegelf\195\182rmig an. Also nicht zu eng stehen sonst trifft das mehrere.\
Dadurch, dass die DDs mit dem Wind stehen erhalten sie SPELL(88282), der sie deutlich schneller casten/angreifen l\195\164sst. Achtet also darauf wie ihr steht."
L["T43875"] = "SPELL(87618): Jeder bekommt diesen Debuff. Man ist 18 Sekunden lang gewurzelt. Muss dispellt werden!\
Statisches Dreieck: Asaad castet nach und Nach 3 Punkte auf dem Boden, die er miteinander verbindet. In das entstehende Dreieck m\195\188ssen alle rein, ansonsten sterbt ihr an SPELL(86930).\
SPELL(93993): Nach jeder Dreiecksphase castet er sofort einen Kettenblitzschlag. Versucht daher schnell sternf\195\182rmig auseinander zu gehen!"
L["T43878"] = "Es entstehen am Rand kleine Wirbelst\195\188rme, die einen Kreis bilden. Ab und zu ruft der Boss alle diese in die Mitte zu sich. Wer direkt dran steht bekommt Schaden und erh\195\164llt einen Stilleeffekt.\
Daher ist es die einfachste Taktik, das ALLE direkt in dem Boss stehen und die Wirbelst\195\188me ignorieren. Der Schaden den man erh\195\164llt ist somit sogar geringer, da der Boss so schneller stirbt.\
Alternative Taktik: Wenn die St\195\188rme in die Mitte kommen geht man schnell nach aussen. Wartet dort und wenn die St\195\188rme wieder nach Aussen gehen, geht man wieder in die Mitte. Nachteil: Melee macht fast kein Schaden."
L["T44577"] = "Der Boss verteilt auf dem Boden bomben SPELL(91259). Von diesen muss ein Abstand eingehalten werden. Die Bomben k\195\182nnen auch inaktiv werden, dennoch gilt: Abstand! SPELL(91263)\
Manchmal packt der Boss einen Spieler und schleudert ihn gegen eine S\195\164ule. Einfach gegenheilen.\
SPELL(83445): Der Boss bleibt stehen und castet braune Streifen sternenartig von sich. Aus diesen einfach rausgehen.\
Generell gilt: Heiler und Tank m\195\188ssen immer eine Sichtlinie bilden, da der Boss hier stark hin und her gezogen werden muss, ist das nicht immer so einfach."
L["T44819"] = "Es ist ganz einfach. Bei 90% bekommt der Boss SPELL(84589). Dann nur noch Schaden auf die Adds machen.\
Ads: einfach Tanken und t\195\182ten. Dabei immer aus den gr\195\188nen und grauen Wirbeln auf dem Boden raus gehen. Mehr f\195\164llt mir hier nicht ein."
L["T46962"] = "Harter Kampf. Vorbemerkungen: HT/TimeWarp aufsparen f\195\188r 25%. Heiler nicht alles vollheilen, nur am Leben lassen mit ca 40-50% Leben.\
SPELL(93712): F\195\188gt einem Spieler Schaden zu. Unterbrechen, da nicht alle Spieler immer voll sein k\195\182nnen!\
SPELL(93713): Er heilt sich massiv. UNBEDINGT kicken!\
SPELL(93710): Er hebt alle Spieler hoch und reduziert deren Leben auf 1% EGAL wie voll sie vorher waren.\
SPELL(93705): Wird sofort nach Katastrophe gecastet. Er heilt AOE ALLES auch sich. H\195\182chtens 2 Ticks durchlassen, dann kicken. Wenn sofort gekickt, dann ist Tank bei 1% HP :).\
Das A und O dieses Kampfes ist, dass ihr euch ausmacht wer was kickt."
L["T46963"] = "SPELL(93617): Alle in Bewegung bleiben! SPELL(93689): Alle stehen bleiben!\
SPELL(93527): Schauen das man nicht drin steht."
L["T46964"] = "Der Tank tankt in einer Ecke, sodass Godfrey in die Ecke schaut. Wenn er SPELL(93520) castet muss der Tank einfach nur 2 Schritte raus machen.\
Kurz vor SPELL(93520) wirkt er SPELL(93707), einfach AE tanken und umhauen. Entfluchen ALLER Gruppenmitglieder nicht vergessen, wegen SPELL(93761)."
L["T47162"] = "Phase 1: Boss wirkt SPELL(87859) oder SPELL(87861), teleportiert sich manchmal und hat dabei Aggro Reset.\
Phase 2: Boss bleibt in der Mitte. Es erscheint eine SPELL(91398), welche um den Boss rotiert. ACHTUNG: Immer in Bewegung bleiben. Adds down machen mit AoE Schaden."
L["T47297"] = "Der Boss verteilt mit der Zeit \195\188berall Bomben. Von diesen weg gehen.\
Wenn jemand eine Bombe vom Boss umgeschnallt bekommt SPELL(88352), sollte dieser unter den querliegenden Baumstamm gehen, damit er nicht so hoch geschossen wird.\
Von Zeit zu Zeit packt der Boss einen Spieler und rammt ihn gegen einen Baumstamm. Dieser Spieler ben\195\182tigt davor und danach starke Heilung. "
L["T47626"] = "Bossphase: Boss wird getankt und st\195\188rmt manchmal einen Spieler an. In sp\195\164teren Bossphasen sind auch adds da um die sich gek\195\188mmert werden muss.\
Addphase: Es erscheinen kleine D\195\164mpfe (Ads) die sofort get\195\182tet werden m\195\188ssen. Dr\195\188ckt v dann seht ihr die Balken und somit die adds schneller, denn diese wachsen.\
Je gr\195\182\195\159er die Adds desto mehr Schaden machen sie. Phasen wechseln sich ab, adds kommen aber immer. Bei 10% ruft er extrem viele Ads. Dann Tank CDs z\195\188nden und Boss umhauen und adds ignorieren."
L["T47739"] = "Cookie steigt in einen Topf. Er wirft mit gutem Essen ( leuchtet gelb ) und schlechtem Essen ( gr\195\188n ) um sich. Das gute essen um SPELL(92834) zu erhalten und aus dem Schlechten SPELL(92066) rausgehen."
L["T49541"] = "Vanessa wird normal getankt. Es erscheinen immer wieder 2 Ads. Diese sollten schnell fokusiert werden. Insbesondere die Blutmagier sind zu unterbrechen.\
Bei 50% verschwinden m\195\182gliche Adds sowie der Boss. Es erscheinen an der Seite des Schiffes 5 Seile. Jeder aus der Gruppe klickt sofort mit Rechtsklick darauf.\
Nach der Tarzan-Einlage geht es wie gewohnt weiter bis 25%, dann kommen wieder Seile und danach kommen keine Adds mehr und sie ist so gut wie tot."
L["TACTICS"] = "Taktik f\195\188r "
L["T41570"] = "Taktik fuer Magmaw: TODO (hier koennt ihr eure eigenen taktiken eintragen)"
L["T42180"] = "Taktik fuer Omnitron Defense System  TODO (hier koennt ihr eure eigenen taktiken eintragen)"
L["T41378"] = "Taktik fuer Maloriak  TODO (hier koennt ihr eure eigenen taktiken eintragen)"
L["T41442"] = "Taktik fuer Atramedes  TODO (hier koennt ihr eure eigenen taktiken eintragen)"
L["T43296"] = "Taktik fuer Chimaeron TODO (hier koennt ihr eure eigenen taktiken eintragen)"
L["T41376"] = "Taktik fuer Nefarian  TODO (hier koennt ihr eure eigenen taktiken eintragen)"
L["T44600"] = "Taktik fuer Halfus Wyrmbreaker  TODO (hier koennt ihr eure eigenen taktiken eintragen)"
L["T45992"] = "Taktik fuer Valiona  TODO (hier koennt ihr eure eigenen taktiken eintragen)"
L["T43735"] = "Taktik fuer Ascendant Council  TODO (hier koennt ihr eure eigenen taktiken eintragen)"
L["T43324"] = "Taktik fuer Cho'gall TODO (hier koennt ihr eure eigenen taktiken eintragen)"
L["T47120"] = "Taktik fuer Argaloth TODO (hier koennt ihr eure eigenen taktiken eintragen)"
L["T45871"] = "Taktik fuer Conclave of Wind  TODO (hier koennt ihr eure eigenen taktiken eintragen)"
L["T46753"] = "Taktik fuer Al'Akir TODO (hier koennt ihr eure eigenen taktiken eintragen)"
L["RAID"] = "Raid"
	end
end
fr:SetScript("OnEvent", fr.OnEvent)
