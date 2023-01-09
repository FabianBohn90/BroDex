//
//  Translator.swift
//  BroDex
//
//  Created by Fabian Bohn on 08.01.23.
//

import Foundation

let translationTable: [String: String] = [
    
    // MARK: 1. Generation
    
    "bulbasaur": "Bisasam",
    "ivysaur": "Bisaknops",
    "venusaur": "Bisaflor",
    "charmander": "Glumanda",
    "charmeleon": "Glutexo",
    "charizard": "Glurak",
    "squirtle": "Schiggy",
    "wartortle": "Schillok",
    "blastoise": "Turtok",
    "caterpie": "Raupy",
    "metapod": "Safcon",
    "butterfree": "Smettbo",
    "weedle": "Hornliu",
    "kakuna": "Kokuna",
    "beedrill": "Bibor",
    "pidgey": "Taubsi",
    "pidgeotto": "Tauboga",
    "pidgeot": "Tauboss",
    "rattata": "Rattfratz",
    "raticate": "Rattikarl",
    "spearow": "Habitak",
    "fearow": "Ibitak",
    "ekans": "Rettan",
    "arbok": "Arbok",
    "pikachu": "Pikachu",
    "raichu": "Raichu",
    "sandshrew": "Sandan",
    "sandslash": "Sandamer",
    "nidoran-f": "Nidoran ♀",
    "nidorina": "Nidorana",
    "nidoqueen": "Nidoqueen",
    "nidoran-m": "Nidoran♂",
    "nidorino": "Nidorino",
    "nidoking": "Nidoking",
    "clefairy": "Piepi",
    "clefable": "Pixi",
    "vulpix": "Vulpix",
    "ninetales": "Vulnona",
    "jigglypuff": "Pummeluff",
    "wigglytuff": "Knuddeluff",
    "zubat": "Zubat",
    "golbat": "Golbat",
    "oddish": "Myrapla",
    "gloom": "Duflor",
    "vileplume": "Giflor",
    "paras": "Paras",
    "parasect": "Parasek",
    "venonat": "Bluzuk",
    "venomoth": "Omot",
    "diglett": "Digda",
    "dugtrio": "Digdri",
    "meowth": "Mauzi",
    "persian": "Snobilikat",
    "psyduck": "Enton",
    "golduck": "Entoron",
    "mankey": "Menki",
    "primeape": "Rasaff",
    "growlithe": "Fukano",
    "arcanine": "Arkani",
    "poliwag": "Quapsel",
    "poliwhirl": "Quaputzi",
    "poliwrath": "Quappo",
    "abra": "Abra",
    "kadabra": "Kadabra",
    "alakazam": "Simsala",
    "machop": "Machollo",
    "machoke": "Maschock",
    "machamp": "Machomei",
    "bellsprout": "Knofensa",
    "weepinbell": "Ultrigaria",
    "victreebel": "Sarzenia",
    "tentacool": "Tentacha",
    "tentacruel": "Tentoxa",
    "geodude": "KLeinstein",
    "graveler": "Georok",
    "golem": "Geowaz",
    "ponyta": "Ponita",
    "rapidash": "Gallopa",
    "slowpoke": "Flegmon",
    "slowbro": "Lahmus",
    "magnemite": "Magnetilo",
    "magneton": "Magneton",
    "farfetchd": "Porenta",
    "doduo": "Dodu",
    "dodrio": "Dodri",
    "seel": "Jurop",
    "dewgong": "Jugong",
    "grimer": "Sleima",
    "muk": "Sleimok",
    "shellder": "Muschas",
    "cloyster": "Austos",
    "gastly": "Nebulak",
    "haunter": "Alpollo",
    "gengar": "Gengar",
    "onix": "Onix",
    "drowzee": "Traumato",
    "hypno": "Hypno",
    "krabby": "Krabby",
    "kingler": "Kingler",
    "voltorb": "Voltobal",
    "electrode": "Lektrobal",
    "exeggcute": "Owei",
    "exeggutor": "Kokowei",
    "cubone": "Tragosso",
    "marowak": "Knogga",
    "hitmonlee": "Kicklee",
    "hitmonchan": "Nockchan",
    "lickitung": "Schlurp",
    "koffing": "Smogon",
    "weezing": "Smogmog",
    "rhyhorn": "Rihorn",
    "rhydon": "Rizeros",
    "chansey": "Chaneira",
    "tangela": "Tangela",
    "kangaskhan": "Kangama",
    "horsea": "Seeper",
    "seadra": "Seemon",
    "goldeen": "Goldini",
    "seaking": "Goldking",
    "staryu": "Sterndu",
    "starmie": "Starmie",
    "mr-mime": "Pantimos",
    "scyther": "Sichlor",
    "jynx": "Rossana",
    "electabuzz": "Elektek",
    "magmar": "Magmar",
    "pinsir": "Pinsir",
    "tauros": "Tauros",
    "magikarp": "Karpador",
    "gyarados": "Garados",
    "lapras": "Lapras",
    "ditto": "Ditto",
    "eevee": "Evoli",
    "vaporeon": "Aquana",
    "jolteon": "Blitza",
    "flareon": "Flamara",
    "porygon": "Porygon",
    "omanyte": "Amonitas",
    "omastar": "Amorosso",
    "kabuto": "Kabuto",
    "kabutops": "Kabutops",
    "aerodactyl": "Aerodactyl",
    "snorlax": "Relaxo",
    "articuno": "Arktos",
    "zapdos": "Zapdos",
    "moltres": "Lavados",
    "dratini": "Dratini",
    "dragonair": "Dragoran",
    "dragonite": "Dragoran",
    "mewtwo": "Mewtu",
    "mew": "Mew",
    
    //-----------------------------------------------------
    // MARK: 2. Generation
    
    "chikorita": "Endivie",
    "bayleef": "Lorblatt",
    "meganium": "Meganie",
    "cyndaquil": "Feurigel",
    "quilava": "Igelavar",
    "typhlosion": "Tornupto",
    "totodile": "Karnimani",
    "croconaw": "Tyracroc",
    "feraligatr": "Impergator",
    "sentret": "Wisor",
    "furret": "Wiesenior",
    "hoothoot": "Hoothoot",
    "noctowl": "Noctowl",
    "ledyba": "Ledyba",
    "ledian": "Ledian",
    "spinarak": "Weberak",
    "ariados": "Ariados",
    "crobat": "Iksbat",
    "chinchou": "Lampi",
    "Lanturn": "Lanturn",
    "pichu": "Pichu",
    "cleffa": "Pii",
    "igglybuff": "Fluffeluff",
    "togepi": "Togepi",
    "togetic": "Togetic",
    "natu": "Natu",
    "xatu": "Xatu",
    "mareep": "Voltilamm",
    "flaaffy": "Waaty",
    "ampharos": "Ampharos",
    "bellossom": "Blubella",
    "marill": "Marill",
    "azumarill": "Azumarill",
    "sudowoodo": "Mogelbaum",
    "politoed": "Quaxo",
    "hoppip": "Hoppspross",
    "skiploom": "Hubelupf",
    "jumpluff": "Papungha",
    "aipom": "Griffel",
    "sunkern": "Sonnkern",
    "sunflora": "Sonnflora",
    "yanma": "Yanma",
    "wooper": "Felino",
    "quagsire": "Morlord",
    "espeon": "Psiana",
    "umbreon": "Nachtara",
    "murkrow": "Kramurx",
    "slowking": "Laschoking",
    "misdreavus": "Traunfugil",
    "unown": "Icognito",
    "wobbuffet": "Woingenau",
    "girafarig": "Girafarig",
    "pineco": "Tannza",
    "forretress": "Forstellka",
    "dunsparce": "Dummisel",
    "steelix": "Stahlos",
    "snubbull": "Snubbull",
    "granbull": "Granbull",
    "qwilfish": "Baldorfish",
    "scizor": "Scherox",
    "shuckle": "Pottrott",
    "heracross": "Skaraborn",
    "sneasel": "Sniebel",
    "teddiursa": "Teddiursa",
    "ursaring": "Ursaring",
    "slugma": "Schneckmag",
    "magcargo": "Magcargo",
    "swinub": "Quiekel",
    "piloswine": "Keifel",
    "corsola": "Corasonn",
    "remoraid": "Remoraid",
    "octillery": "Octillery",
    "delibird": "Botogel",
    "mantine": "Mantax",
    "skarmory": "Panzaeron",
    "houndour": "Hunduster",
    "houndoom": "Hundemon",
    "kingdra": "Seedraking",
    "phanpy": "Phanpy",
    "donphan": "Donphan",
    "porygon2": "Porygon2",
    "stantler": "Damhirplex",
    "smeargle": "Farbeagle",
    "tyrogue": "Rabauz",
    "hitmontop": "Kapoera",
    "smoochum": "Kussilla",
    "elekid": "Elekid",
    "magby": "Magby",
    "miltank": "Miltank",
    "blissey": "Heiteira",
    "raikou": "Raikou",
    "entei": "Entei",
    "suicune": "Suicune",
    "larvitar": "Larvitar",
    "pupitar": "Pupitar",
    "tyranitar": "Despotar",
    "lugia": "Lugia",
    "ho-oh": "Ho-Oh",
    "celebi": "Celebi",
    
    //-----------------------------------------------------
    // MARK: 3. Generation
    
    "treecko": "Geckarbor",
    "grovyle": "Reptain",
    "sceptile": "Gewaldro",
    "torchic": "Flemmli",
    "combusken": "Jungglut",
    "blaziken": "Lohgock",
    "mudkip": "Hydropi",
    "marshtomp": "Moorabbel",
    "swampert": "Sumpex",
    "poochyena": "Fiffyen",
    "mightyena": "Magnayen",
    "zigzagoon": "Zigzachs",
    "linoone": "Geradaks",
    "wurmple": "Waumpel",
    "silcoon": "Schaloko",
    "beautifly": "Papinella",
    "cascoon": "Panekon",
    "dustox": "Pudox",
    "lotad": "Loturzel",
    "lombre": "Lombrero",
    "seedot": "Samurzel",
    "nuzleaf": "Blanas",
    "shiftry": "Tengulist",
    "taillow": "Schwalbini",
    "swellow": "Schwalboss",
    "wingull": "Wingull",
    "pelipper": "Pelipper",
    "ralts": "Trasla",
    "kirlia": "Kirlia",
    "gardevoir": "Guardevoir",
    "surskit": "Gehweiher",
    "masquerain": "Maskeregen",
    "shroomish": "Knilz",
    "breloom": "Kapilz",
    "slakoth": "Bummelz",
    "vigoroth": "Muntier",
    "slaking": "Letarking",
    "nincada": "Nincada",
    "ninjask": "Ninjask",
    "shedinja": "Ninjatom",
    "whismur": "Flurmel",
    "loudred": "Krakeelo",
    "exploud": "Krawumms",
    "makuhita": "Makuhita",
    "hariyama": "Hariyama",
    "azurill": "Azurill",
    "nosepass": "Nasgnet",
    "skitty": "Eneco",
    "delcatty": "Enekoro",
    "sableye": "Zobiris",
    "mawile": "Flunkifer",
    "aron": "Stollunior",
    "lairon": "Stollrak",
    "aggron": "Stolloss",
    "meditite": "Meditie",
    "medicham": "Meditalis",
    "electrike": "Frizelbliz",
    "manectric": "Voltenso",
    "plusle": "Plusle",
    "minun": "Minun",
    "volbeat": "Volbeat",
    "illumise": "Illumise",
    "roselia": "Roselia",
    "gulpin": "Schluppuck",
    "swalot": "Schlukwech",
    "carvanha": "Kanivanha",
    "sharpedo": "Tohaido",
    "wailmer": "Wailmer",
    "wailord": "Wailord",
    "numel": "Camaub",
    "camerupt": "Camerupt",
    "torkoal": "Qurtel",
    "spoink": "Spoink",
    "grumpig": "Groink",
    "spinda": "Pandir",
    "trapinch": "Knacklion",
    "vibrava": "Vibrava",
    "flygon": "Libelldra",
    "cacnea": "Tuska",
    "cacturne": "Noktuska",
    "swablu": "Wablu",
    "altaria": "Altaria",
    "zangoose": "Sengo",
    "seviper": "Vipitis",
    "lunatone": "Lunastein",
    "solrock": "Sonnfel",
    "barboach": "Schmerbe",
    "whiscash": "Welsar",
    "corphish": "Krebscorps",
    "crawdaunt": "Krebutack",
    "baltoy": "Puppance",
    "claydol": "Lepumentas",
    "lileep": "Liliep",
    "cradily": "Wielie",
    "anorith": "Anorith",
    "armaldo": "Armaldo",
    "feebas": "Barschwa",
    "milotic": "Milotic",
    "castform": "Formeo",
    "kecleon": "Kecleon",
    "shuppet": "Shuppet",
    "banette": "Banette",
    "duskull": "Zwirrlicht",
    "dusclops": "Zwirrklop",
    "tropius": "Tropius",
    "chimecho": "Palimpalim",
    "absol": "Absol",
    "wynaut": "Isso",
    "snorunt": "Schneppke",
    "glalie": "Firnontor",
    "spheal": "Seemops",
    "sealeo": "Seejong",
    "walrein": "Walraisa",
    "clamperl": "Perlu",
    "huntail": "Aalabyss",
    "gorebyss": "Saganabyss",
    "relicanth": "Relicanth",
    "luvdisc": "Liebiskus",
    "bagon": "Kindwurm",
    "shelgon": "Draschel",
    "salamence": "Brutalanda",
    "beldum": "Tanhel",
    "metang": "Metang",
    "metagross": "Metagross",
    "regirock": "Regirock",
    "regice": "Regice",
    "registeel": "Registeel",
    "latias": "Latias",
    "latios": "Latios",
    "kyogre": "Kyogre",
    "groudon": "Groudon",
    "rayquaza": "Rayquaza",
    "jirachi": "Jirachi",
    "deoxys-normal": "Deoxys",
    
    //-----------------------------------------------------
    //MARK: 4. Genaration
    
    "turtwig":"Chelast",
    "grotle":"Chelcarain",
    "torterra":"Chelterrar",
    "chimchar":"Panflam",
    "monferno":"Panpyro",
    "infernape":"Panferno",
    "piplup":"Plinfa",
    "prinplup":"Pliprin",
    "empoleon":"Impoleon",
    "starly":"Staralili",
    "staravia":"Staravia",
    "staraptor":"Staraptor",
    "bidoof":"Bidiza",
    "bibarel":"Bidifas",
    "kricketot":"Zirpurze",
    "kricketune":"Zirpeise",
    "shinx":"Sheinux",
    "luxio":"Luxio",
    "luxray":"Luxtra",
    "budew":"Knospi",
    "roserade":"Roserade",
    "cranidos":"Koknodon",
    "rampardos":"Rameidon",
    "shieldon":"Schilterus",
    "bastiodon":"Bollterus",
    "burmy":"Burmy",
    "wormadam-plant":"Burmadame",
    "mothim":"Moterpel",
    "combee":"Wadribie",
    "vespiquen":"Honweisel",
    "pachirisu":"Pachirisu",
    "buizel":"Bamelin",
    "floatzel":"Bojelin",
    "cherubi":"Kikugi",
    "cherrim":"Kinoso",
    "shellos":"Schalellos",
    "gastrodon":"Gastrodon",
    "ambipom":"Ambidiffel",
    "drifloon":"Driftlon",
    "drifblim":"Drifzepeli",
    "buneary":"Haspiror",
    "lopunny":"Schlapor",
    "mismagius":"Traunmagil",
    "honchkrow":"Kramshef",
    "glameow":"Charmian",
    "purugly":"Shnurgarst",
    "chingling":"Klingplim",
    "stunky":"Skunkapuh",
    "skuntank":"Skuntank",
    "bronzor":"Bronzel",
    "bronzong":"Bronzong",
    "bonsly":"Mobai",
    "mime-jr":"Pantimimi",
    "happiny":"Wonneira",
    "chatot":"Plaudagei",
    "spiritomb":"Kryppuk",
    "gible":"Kaumalat",
    "gabite":"Knarksel",
    "garchomp":"Knakrack",
    "munchlax":"Mampfaxo",
    "riolu":"Riolu",
    "lucario":"Lucario",
    "hippopotas":"Hippopotas",
    "hippowdon":"Hippoterus",
    "skorupi":"Pionskora",
    "drapion":"Piondragi",
    "croagunk":"Glibunkel",
    "toxicroak":"Toxiquak",
    "carnivine":"Venuflibis",
    "finneon":"Finneon",
    "lumineon":"Lumineon",
    "mantyke":"Mantirps",
    "snover":"Shnebedeck",
    "abomasnow":"Rexblisar",
    "weavile":"Snibunna",
    "magnezone":"Magnezone",
    "lickilicky":"Schlurplek",
    "rhyperior":"Rihornior",
    "tangrowth":"Tangoloss",
    "electivire":"Elevoltek",
    "magmortar":"Magbrant",
    "togekiss":"Togekiss",
    "yanmega":"Yanmega",
    "leafeon":"Folipurba",
    "glaceon":"Glaziola",
    "gliscor":"Skorgro",
    "mamoswine":"Mamutel",
    "porygon-z":"Porygon-Z",
    "gallade":"Galagladi",
    "probopass":"Voluminas",
    "dusknoir":"Zwirrfinst",
    "froslass":"Frosdedje",
    "rotom":"Rotom",
    "uxie":"Selfe",
    "mesprit":"Vesprit",
    "azelf":"Tobutz",
    "dialga":"Dialga",
    "palkia":"Palkia",
    "heatran":"Heatran",
    "regigigas":"Regigigas",
    "giratina-altered":"Giratina",
    "cresselia":"Cresselia",
    "phione":"Phione",
    "manaphy":"Manaphy",
    "darkrai":"Darkrai",
    "shaymin-land":"Shaymin",
    "arceus":"Arceus",
    
    //-----------------------------------------------------
    //MARK: 5. Genaration
    
    "victini":"Victini",
    "snivy":"Serpifeu",
    "servine":"Efoserp",
    "serperior":"Serpiroyal",
    "tepig":"Floink",
    "pignite":"Ferkokel",
    "emboar":"Flambirex",
    "oshawott":"Ottaro",
    "dewott":"Zwottronin",
    "samurott":"Admurai",
    "patrat":"Nagelotz",
    "watchog":"Kukmarda",
    "lillipup":"Yorkleff",
    "herdier":"Terribark",
    "stoutland":"Bissbark",
    "purrloin":"Felilou",
    "liepard":"Kleoparda",
    "pansage":"Vegimak",
    "simisear":"Grillchita",
    "panpour":"Sodamak",
    "simipour":"Sodachita",
    "munna":"Somniam",
    "musharna":"Somnivora",
    "pidove":"Dusselgurr",
    "tranquill":"Navitaub",
    "unfezant":"Fasanob",
    "blitzle":"Elezeba",
    "zebstrika":"Zebritz",
    "roggenrola":"Kiesling",
    "boldore":"Sedimantur",
    "gigalith":"Brockoloss",
    "woobat":"Fleknoil",
    "swoobat":"Fletiamo",
    "drilbur":"Rotomurf",
    "excadrill":"Stalobor",
    "audino":"Ohrdoch",
    "timburr":"Praktibalk",
    "gurdurr":"Strepoli",
    "conkeldurr":"Meistagrif",
    "tympole":"Schallquap",
    "palpitoad":"Mebrana",
    "seismitoad":"Branawarz",
    "throh":"Jiutesto",
    "sawk":"Karadonis",
    "sewaddle":"Strawickl",
    "swadloon":"Folikon",
    "leavanny":"Matrifol",
    "venipede":"Toxiped",
    "whirlipede":"Rollum",
    "scolipede":"Cerapendra",
    "cottonee":"Waumboll",
    "whimsicott":"Elfun",
    "petilil":"Lilminip",
    "lilligant":"Dressella",
    "basculin":"Barschuft",
    "sandile":"Ganovil",
    "krokorok":"Rokkaiman",
    "krookodile":"Rabigator",
    "darumaka":"Flampion",
    "darmanitan-standard":"Flampivian",
    "maractus":"Maracamba",
    "dwebble":"Lithomith",
    "crustle":"Castelith",
    "scraggy":"Zurrkoex",
    "scrafty":"Irokex",
    "sigilyph":"Symvolara",
    "yamask":"Makabaja",
    "cofagrigus":"Echnatoll",
    "tirtouga":"Galapaflos",
    "carracosta":"Karippas",
    "archen":"Flapteryx",
    "archeops":"Aeropteryx",
    "trubbish":"Unratütox",
    "garbodor":"Deponitox",
    "zorua":"Zorua",
    "zoroark":"Zoroark",
    "minccino":"Picochilla",
    "cinccino":"Chillabell",
    "gothita":"Mollimorba",
    "gothorita":"Hypnomorba",
    "gothitelle":"Morbitesse",
    "solosis":"Monozyto",
    "duosion":"Mitodos",
    "reuniclus":"Zytomega",
    "ducklett":"Piccolente",
    "swanna":"Swaroness",
    "vanillite":"Gelatini",
    "vanillish":"Gelatwino",
    "deerling":"Sesokitz",
    "sawsbuck":"Kronjuwild",
    "emolga":"Emolga",
    "karrablast":"Laukaps",
    "escavalier":"Cavalanzas",
    "foongus":"Tarnpignon",
    "amoonguss":"Hutsassa",
    "frillish":"Quabbel",
    "jellicent":"Apoquallyp",
    "alomomola":"Mamolida",
    "joltik":"Wattzapf",
    "galvantula":"Voltula",
    "ferroseed":"Kastadur",
    "ferrothorn":"Tentantel",
    "klink":"Klikk",
    "klang":"Kliklak",
    "klinklang":"Klikdiklak",
    "tynamo":"Zapplardin",
    "eelektrik":"Zapplalek",
    "eelektross":"Zapplarang",
    "elgyem":"Pygraulon",
    "beheeyem":"Megalon",
    "litwick":"Lichtel",
    "lampent":"Laternecto",
    "chandelure":"Skelabra",
    "axew":"Milza",
    "fraxure":"Sharfax",
    "haxorus":"Maxax",
    "cubchoo":"Petznief",
    "beartic":"Siberio",
    "cryogonal":"Frigometri",
    "shelmet":"Schnuthelm",
    "accelgor":"Hydragil",
    "stunfisk":"Flunschlik",
    "mienfoo":"Lin-Fu",
    "mienshao":"Wie-Shu",
    "druddigon":"Shardrago",
    "golett":"Golbit",
    "golurk":"Golgantes",
    "pawniard":"Gladiantri",
    "bisharp":"Caesurio",
    "bouffalant":"Bisofank",
    "rufflet":"Geronimatz",
    "braviary":"Washakwil",
    "vullaby":"Skallyk",
    "mandibuzz":"Grypheldis",
    "heatmor":"Furnifraß",
    "durant":"Fermicula",
    "deino":"Kapuno",
    "zweilous":"Duodino",
    "hydreigon":"Trikephalo",
    "larvesta":"Ignivor",
    "volcarona":"Ramoth",
    "cobalion":"Kobalium",
    "terrakion":"Terrakium",
    "virizion":"Viridium",
    "tornadus-incarnate":"Boreos",
    "thundurus-incarnate":"Voltolos",
    "reshiram":"Reshiram",
    "zekrom":"Zekrom",
    "landorus-incarnate":"Demeteros",
    "kyurem":"Kyurem",
    "keldeo-ordinary":"Keldeo",
    "meloetta-aria":"Meloetta",
    "genesect":"Genesect",
    
    //-----------------------------------------------------
    // MARK: 6. Generation
    
    "chespin":"Igamaro",
    "quilladin":"Igastarnish",
    "chesnaught":"Brigaron",
    "fennekin":"Fynx",
    "braixen":"Rutena",
    "delphox":"Fennexis",
    "froakie":"Froxy",
    "frogadier":"Amphizel",
    "greninja":"Quajutsu",
    "bunnelby":"Scoppel",
    "diggersby":"Grebbit",
    "fletchling":"Dartiri",
    "fletchinder":"Dartignis",
    "talonflame":"Fiaro",
    "scatterbug":"Purmel",
    "spewpa":"Puponcho",
    "vivillon":"Vivillon",
    "litleo":"Leufeo",
    "pyroar":"Pyroleo",
    "flabebe":"Flabébé",
    "floette":"Floette",
    "florges":"Florges",
    "skiddo":"Mähikel",
    "gogoat":"Chevrumm",
    "pancham":"Pam-Pam",
    "pangoro":"Pandagro",
    "furfrou":"Coiffwaff",
    "espurr":"Psiau",
    "meowstic-male":"Psiaugon",
    "honedge":"Gramokles",
    "doublade":"Duokles",
    "aegislash-shield":"Durengard",
    "spritzee":"Parfi",
    "aromatisse":"Parfinesse",
    "swirlix":"Flauschling",
    "slurpuff":"Sabbaione",
    "inkay":"Iscalar",
    "malamar":"Calamanero",
    "binacle":"Bithora",
    "barbaracle":"Thanathora",
    "skrelp":"Algitt",
    "dragalge":"Tandrak",
    "clauncher":"Scampisto",
    "clawitzer":"Wummer",
    "helioptile":"Eguana",
    "heliolisk":"Elezard",
    "tyrunt":"Balgoras",
    "tyrantrum":"Monargoras",
    "amaura":"Amarino",
    "aurorus":"Amagarga",
    "sylveon":"Feelinara",
    "hawlucha":"Resladero",
    "dedenne":"Dedenne",
    "carbink":"Rocara",
    "goomy":"Viscora",
    "sliggoo":"Viscargot",
    "goodra":"Viscogon",
    "klefki":"Clavion",
    "phantump":"Paragoni",
    "trevenant":"Trombork",
    "pumpkaboo-average":"Irrbis",
    "gourgeist-average":"Pumpdjinn",
    "bergmite":"Arktip",
    "avalugg":"Arktilas",
    "noibat":"eF-eM",
    "noivern":"UHaFnir",
    "xerneas":"Xerneas",
    "yveltal":"Yveltal",
    "zygarde-50":"Zygarde",
    "diancie":"Diancie",
    "hoopa":"Hoopa",
    "volcanion":"Volcanion",
    
    //-----------------------------------------------------
    // MARK: 7. Generation
    
    "rowlet":"Bauz",
    "dartrix":"Arboretoss",
    "decidueye":"Silvarro",
    "litten":"Flamiau",
    "torracat":"Miezunder",
    "incineroar":"Fuegro",
    "popplio":"Robball",
    "brionne":"Marikeck",
    "primarina":"Primarene",
    "pikipek":"Peppeck",
    "trumbeak":"Trompeck",
    "toucannon":"Tukanon",
    "yungoos":"Mangunior",
    "gumshoos":"Manguspektor",
    "grubbin":"Mabula",
    "charjabug":"Akkup",
    "vikavolt":"Donarion",
    "crabrawler":"Krabbox",
    "crabominable":"Krawell",
    "oricorio-baile":"Choreogel",
    "cutiefly":"Wommel",
    "ribombee":"Bandelby",
    "rockruff":"Wuffels",
    "lycanroc-midday":"Wolwerock",
    "wishiwashi-solo":"Lusardin",
    "mareanie":"Garstella",
    "toxapex":"Aggrostella",
    "mudbray":"Pampuli",
    "mudsdale":"Pampross",
    "dewpider":"Araqua",
    "araquanid":"Aranestro",
    "fomantis":"Imantis",
    "lurantis":"Mantidea",
    "morelull":"Bubungus",
    "shiinotic":"Lamellux",
    "salandit":"Molunk",
    "salazzle":"Amfira",
    "stufful":"Velursi",
    "bewear":"Kosturso",
    "bounsweet":"Frubberl",
    "steenee":"Frubaila",
    "tsareena":"Fruyal",
    "comfey":"Curelei",
    "oranguru":"Kommandutan",
    "passimian":"Quartermak",
    "wimpod":"Reißlaus",
    "golisopod":"Tectass",
    "sandygast":"Sankabuh",
    "palossand":"Colossand",
    "pyukumuku":"Gufa",
    "type-null":"Typ:Null",
    "silvally":"Amigento",
    "minior-red-meteor":"Meteno",
    "komala":"Koalelu",
    "turtonator":"Tortunator",
    "togedemaru":"Togedemaru",
    "mimikyu-disguised":"Mimigma",
    "bruxish":"Knirfish",
    "drampa":"Sen-Long",
    "dhelmise":"Moruda",
    "jangmo-o":"Miniras",
    "hakamo-o":"Mediras",
    "kommo-o":"Grandiras",
    "tapu-koko":"Kapu-Riki",
    "tapu-lele":"Kapu-Fala",
    "tapu-bulu":"Kapu-Toro",
    "tapu-fini":"Kapu-Kime",
    "cosmog":"Cosmog",
    "cosmoem":"Cosmovum",
    "solgaleo":"Solgaleo",
    "lunala":"Lunala",
    "nihilego":"Anego",
    "buzzwole":"Masskito",
    "pheromosa":"Schabelle",
    "xurkitree":"Voltriant",
    "celesteela":"Kaguron",
    "kartana":"Katagami",
    "guzzlord":"Schlingking",
    "necrozma":"Necrozma",
    "magearna":"Magearna",
    "marshadow":"Marshadow",
    "poipole":"Venicro",
    "naganadel":"Agoyon",
    "stakataka":"Muramura",
    "blacephalon":"Kopplosio",
    "zeraora":"Zeraora",
    "meltan":"Meltan",
    "melmetal":"Melmetal",

    //-----------------------------------------------------
    // MARK: 8. Generation
    
    "grookey" : "Chimpep" ,
    "thwackey" : "Chimstix" ,
    "rillaboom" : "Gortrom" ,
    "scorbunny" : "Hopplo" ,
    "raboot" : "Kickerlo" ,
    "cinderace" : "Liberlo" ,
    "sobble" : "Memmeon" ,
    "drizzile" : "Phlegleon" ,
    "inteleon" : "Intelleon" ,
    "skwovet" : "Raffel" ,
    "greedent" : "Schlaraffel" ,
    "rookidee" : "Meikro" ,
    "corvisquire" : "Kranoviz" ,
    "corviknight" : "Krarmor" ,
    "blipbug" : "Sensect" ,
    "dottler" : "Keradar" ,
    "orbeetle" : "Maritellit" ,
    "nickit" : "Kleptifux" ,
    "thievul" : "Gaunux" ,
    "gossifleur" : "Cottini" ,
    "eldegoss" : "Cottomi" ,
    "wooloo" : "Wolly" ,
    "dubwool" : "Zwollock" ,
    "chewtle" : "Kamehaps" ,
    "drednaw" : "Kamalm" ,
    "yamper" : "Voldi" ,
    "boltund" : "Bellektro" ,
    "rolycoly" : "Klonkett" ,
    "carkol" : "Wagong" ,
    "coalossal" : "Montecarbo" ,
    "applin" : "Knapfel" ,
    "flapple" : "Drapfel" ,
    "appletun" : "Schlapfel" ,
    "silicobra" : "Salanga" ,
    "sandaconda" : "Sanaconda" ,
    "cramorant" : "Urgl" ,
    "arrokuda" : "Pikuda" ,
    "barraskewda" : "Barrakiefa" ,
    "toxel" : "Toxel" ,
    "toxtricity-amped" : "Riffex" ,
    "sizzlipede" : "Thermopod" ,
    "centiskorch" : "Infernopod" ,
    "clobbopus" : "Klopptopus" ,
    "grapploct" : "Kaocto" ,
    "sinistea" : "Fatalitee" ,
    "polteageist" : "Mortipot" ,
    "hatenna" : "Brimova" ,
    "hattrem" : "Brimano" ,
    "hatterene" : "Silembrim" ,
    "impidimp" : "Bähmon" ,
    "morgrem" : "Pelzebub" ,
    "grimmsnarl" : "Olangaar" ,
    "obstagoon" : "Barrikadax" ,
    "perrserker" : "Mauzinger" ,
    "cursola" : "Gorgasonn" ,
    "sirfetchd" : "Lauchzelot" ,
    "mr-rime" : "Pantifrost" ,
    "runerigus" : "Oghnatoll" ,
    "milcery" : "Hokumil" ,
    "alcremie" : "Pokusan" ,
    "falinks" : "Legios" ,
    "pincurchin" : "Britzigel" ,
    "snom" : "Snomnom" ,
    "frosmoth" : "Mottineva" ,
    "stonjourner" : "Humanolith" ,
    "eiscue-ice" : "Kubuin" ,
    "indeedee-male" : "Servol" ,
    "morpeko-full-belly" : "Morpeko" ,
    "cufant" : "Kupfanti" ,
    "copperajah" : "Patinaraja" ,
    "dracozolt" : "Lectragon" ,
    "arctozolt" : "Lecryodon" ,
    "dracovish" : "Pescragon" ,
    "arctovish" : "Pescryodon" ,
    "duraludon" : "Duraludon" ,
    "dreepy" : "Grolldra" ,
    "drakloak" : "Phandra" ,
    "dragapult" : "Katapuldra" ,
    "zacian" : "Zacian" ,
    "zamazenta" : "Zamazenta" ,
    "eternatus" : "Endynalos" ,
    "kubfu" : "Dakuma" ,
    "urshifu-single-strike" : "Wulaosu" ,
    "zarude" : "Zarude" ,
    "regieleki" : "Regieleki",
    "regidrago" : "Regidrago",
    "glastrier" : "Polaross",
    "spectrier" : "Phantoross" ,
    "calyrex" : "Coronospa" ,
    "wyrdeer" : "Damythir" ,
    "kleavor" : "Axantor" ,
    "ursaluna" : "Ursaluna" ,
    "basculegion-male" : "Salmagnis" ,
    "sneasler" : "Snieboss" ,
    "overqwil" : "Myriador" ,
    "enamorus-incarnate" : "Cupidos" ,

]

func translatePokemonName(englishName: String) -> String {
    if let germanName = translationTable[englishName] {
        return germanName
    } else {
        return englishName
    }
}


// MARK: Typen Translator

let translationTableType: [String: String] = [
    "fire" : "Feuer",
    "grass" : "Pflanze",
    "poison" : "Gift",
    "water" : "Wasser",
    "bug" : "Käfer",
    "flying" : "Flug",
    "normal" : "Normal",
    "electric" : "Elektro",
    "ground" : "Boden",
    "fairy" : "Fee",
    "fighting" : "Kampf",
    "psychic" : "Psycho",
    "rock" : "Gestein",
    "ice" : "Eis",
    "dark" : "Unlicht",
    "steel" : "Stahl",
    "dragon" : "Drache",
    "ghost" : "Geist",
]

func translateTypeName(englishName: String) -> String {
    if let germanName = translationTableType[englishName] {
        return germanName
    } else {
        return englishName
    }
}

