TrainerDataPointers:
	dw YoungsterData
	dw BugCatcherData
	dw LassData
	dw SailorData
	dw CamperData
	dw PicnickerData
	dw PokemaniacData
	dw SuperNerdData
	dw HikerData
	dw BikerData
	dw BurglarData
	dw EngineerData
	dw CoupleData
	dw FisherData
	dw SwimmerData
	dw CueBallData
	dw GamblerData
	dw BeautyData
	dw PsychicData
	dw RockerData
	dw JugglerData
	dw TamerData
	dw BirdKeeperData
	dw BlackbeltData
	dw Green1Data
	dw SwimmerFData ; Shared with Beauty
	dw RocketFData ; Shared with male Rocket
	dw ScientistData
	dw GiovanniData
	dw RocketData
	dw AceTrainerMData
	dw AceTrainerFData
	dw BrunoData
	dw BrockData
	dw MistyData
	dw LtSurgeData
	dw ErikaData
	dw KogaData
	dw BlaineData
	dw SabrinaData
	dw GentlemanData
	dw Green2Data
	dw Green3Data
	dw LoreleiData
	dw ChannelerData
	dw AgathaData
	dw LanceData

; first is the name, followed by the first byte of the data
; Rival uses $53,$50 instead of a normal name

; if first byte != FF, FE, or FD, then
	; first byte is level (of all pokemon on this team)
	; all the next bytes are pokemon species
	; null-terminated
; if first byte == FF, then
	; first byte is FF (obviously)
	; every next two bytes are a level and species
	; null-terminated
; if first byte == FE, then
	; first byte is FE
	; second byte is custom sprite number
	; third byte is custom AI number
	; every next two bytes are a level and species
	; null-terminated
; if first byte == FD, then
	; first byte is FD
	; second byte is custom sprite number
	; third byte is level (or all pokemon on this team)
	; all the next bytes are pokemon species
	; null-terminated

	
BrockData:
	db "BROCK@",$FF,12,GEODUDE,14,ONIX,0
	
MistyData:
	db "MISTY@",$FF,18,STARYU,21,STARMIE,0
	
LtSurgeData:
	db "LT.SURGE@",$FF,28,RAICHU,0
	
ErikaData:
	db "ERIKA@",$FF,29,VICTREEBEL,24,TANGELA,29,VILEPLUME,0
	
KogaData:
	db "KOGA@",$FF,37,VENOMOTH,39,MUK,37,GOLBAT,43,WEEZING,0
	
BlaineData:
	db "BLAINE@",$FF,42,GROWLITHE,40,PONYTA,42,RAPIDASH,45,ARCANINE,47,MAGMAR,0
	
SabrinaData:
	db "SABRINA@",$FF,38,KADABRA,37,MR_MIME,38,JOLTEON,43,ALAKAZAM,0
	
GiovanniData:
	db "GIOVANNI@",$FF,25,ONIX,24,RHYHORN,29,KANGASKHAN,0
	db "GIOVANNI@",$FF,35,ONIX,37,RHYHORN,37,NIDORINO,41,NIDOQUEEN,0
	db "GIOVANNI@",$FF,45,RHYDON,42,ONIX,44,NIDOQUEEN,45,NIDOKING,50,RHYDON,0
	
LoreleiData:
	db "LORELEI@",$FF,54,DEWGONG,53,CLOYSTER,54,SLOWBRO,56,JYNX,56,LAPRAS,0
	
BrunoData:
	db "BRUNO@",$FF,53,ONIX,55,HITMONCHAN,55,HITMONLEE,56,ONIX,58,MACHAMP,0	
	
AgathaData:
	db "AGATHA@",$FF,56,GENGAR,56,GENGAR,55,ARBOK,58,GOLBAT,60,GENGAR,0
	
LanceData:
	db "LANCE@",$FF,58,GYARADOS,56,CHARIZARD,56,DRAGONITE,60,AERODACTYL,62,DRAGONITE,0	
	
Green1Data:
	db $53,$50,5,SQUIRTLE,0
	db $53,$50,5,BULBASAUR,0
	db $53,$50,5,CHARMANDER,0
	db $53,$50,$FF,9,PIDGEY,8,SQUIRTLE,0
	db $53,$50,$FF,9,PIDGEY,8,BULBASAUR,0
	db $53,$50,$FF,9,PIDGEY,8,CHARMANDER,0
	db $53,$50,$FF,18,PIDGEOTTO,15,ABRA,15,RATTATA,17,SQUIRTLE,0
	db $53,$50,$FF,18,PIDGEOTTO,15,ABRA,15,RATTATA,17,BULBASAUR,0
	db $53,$50,$FF,18,PIDGEOTTO,15,ABRA,15,RATTATA,17,CHARMANDER,0
	
Green2Data:
	db $53,$50,$FF,19,PIDGEOTTO,16,RATICATE,18,KADABRA,20,WARTORTLE,0
	db $53,$50,$FF,19,PIDGEOTTO,16,RATICATE,18,KADABRA,20,IVYSAUR,0
	db $53,$50,$FF,19,PIDGEOTTO,16,RATICATE,18,KADABRA,20,CHARMELEON,0
	db $53,$50,$FF,25,PIDGEOTTO,23,GROWLITHE,22,EXEGGCUTE,20,KADABRA,25,WARTORTLE,0
	db $53,$50,$FF,25,PIDGEOTTO,23,GYARADOS,22,GROWLITHE,20,KADABRA,25,IVYSAUR,0
	db $53,$50,$FF,25,PIDGEOTTO,23,EXEGGCUTE,22,GYARADOS,20,KADABRA,25,CHARMELEON,0
	db $53,$50,$FF,37,PIDGEOT,38,GROWLITHE,35,EXEGGCUTE,35,ALAKAZAM,40,BLASTOISE,0
	db $53,$50,$FF,37,PIDGEOT,38,GYARADOS,35,GROWLITHE,35,ALAKAZAM,40,VENUSAUR,0
	db $53,$50,$FF,37,PIDGEOT,38,EXEGGCUTE,35,GYARADOS,35,ALAKAZAM,40,CHARIZARD,0
	db $53,$50,$FF,47,PIDGEOT,45,RHYHORN,45,GROWLITHE,47,EXEGGCUTE,50,ALAKAZAM,53,BLASTOISE,0
	db $53,$50,$FF,47,PIDGEOT,45,RHYHORN,45,GYARADOS,47,GROWLITHE,50,ALAKAZAM,53,VENUSAUR,0
	db $53,$50,$FF,47,PIDGEOT,45,RHYHORN,45,EXEGGCUTE,47,GYARADOS,50,ALAKAZAM,53,CHARIZARD,0
	
Green3Data:
	db $53,$50,$FF,61,PIDGEOT,59,ALAKAZAM,61,RHYDON,61,ARCANINE,63,EXEGGUTOR,65,BLASTOISE,0
	db $53,$50,$FF,61,PIDGEOT,59,ALAKAZAM,61,RHYDON,61,GYARADOS,63,ARCANINE,65,VENUSAUR,0
	db $53,$50,$FF,61,PIDGEOT,59,ALAKAZAM,61,RHYDON,61,EXEGGUTOR,63,GYARADOS,65,CHARIZARD,0
	
YoungsterData:
	db "JOEY@",11,RATTATA,EKANS,0
	db "ARNOLD@",14,SPEAROW,0
	db "JEFF@",10,RATTATA,RATTATA,ZUBAT,0
	db "SAMUEL@",14,RATTATA,EKANS,ZUBAT,0
	db "ADAM@",15,RATTATA,SPEAROW,0
	db "BEN@",17,SLOWPOKE,0
	db "CALVIN@",14,EKANS,SANDSHREW,0
	db "CHAD@",21,NIDORAN_M,0
	db "DAN@",21,EKANS,0
	db "DAVE@",19,SANDSHREW,ZUBAT,0
	db "JOSH@",17,RATTATA,RATTATA,RATICATE,0
	db "TIMMY@",18,NIDORAN_M,NIDORINO,0
	db "NASH@",17,SPEAROW,RATTATA,RATTATA,SPEAROW,0
	
BugCatcherData:
	db "LUKE@",6,WEEDLE,CATERPIE,0
	db "FINN@",7,WEEDLE,KAKUNA,WEEDLE,0
	db "JAKE@",9,WEEDLE,0
	db "DAVID@",10,CATERPIE,WEEDLE,CATERPIE,0
	db "LOU@",9,WEEDLE,KAKUNA,CATERPIE,METAPOD,0
	db "LARRY@",11,CATERPIE,METAPOD,0
	db "CHUCK@",11,WEEDLE,KAKUNA,0
	db "ZACH@",10,CATERPIE,METAPOD,CATERPIE,0
	db "CHRIS@",14,CATERPIE,WEEDLE,0
	db "RICK@",16,WEEDLE,CATERPIE,WEEDLE,0
	db "BOB@",20,BUTTERFREE,0
	db "GRAY@",18,METAPOD,CATERPIE,VENONAT,0
	db "MATT@",19,BEEDRILL,BEEDRILL,0
	db "ED@",20,CATERPIE,WEEDLE,VENONAT,0
	
LassData:
	db "NICOLE@",9,PIDGEY,PIDGEY,0
	db "JENNIFER@",10,RATTATA,NIDORAN_M,0
	db "HILLARY@",14,JIGGLYPUFF,0
	db "RACHEL@",31,PARAS,PARAS,PARASECT,0
	db "CHRISTY@",11,ODDISH,BELLSPROUT,0
	db "JESSICA@",14,CLEFAIRY,0
	db "TRISH@",16,PIDGEY,NIDORAN_F,0
	db "MONICA@",14,PIDGEY,NIDORAN_F,0
	db "LULU@",15,NIDORAN_M,NIDORAN_F,0
	db "BROOKE@",13,ODDISH,PIDGEY,ODDISH,0
	db "ROSE@",18,PIDGEY,NIDORAN_F,0
	db "MARTHA@",18,RATTATA,PIKACHU,0
	db "AMANDA@",23,NIDORAN_F,NIDORINA,0
	db "LEAH@",24,MEOWTH,MEOWTH,MEOWTH,0
	db "WHITNEY@",19,PIDGEY,RATTATA,NIDORAN_M,MEOWTH,PIKACHU,0
	db "SAMANTHA@",22,CLEFAIRY,CLEFAIRY,0
	db "KATIE@",23,BELLSPROUT,WEEPINBELL,0
	db "BELLA@",23,ODDISH,GLOOM,0
	
SailorData:
	db "JACK@",18,MACHOP,SHELLDER,0
	db "WILL@",17,MACHOP,TENTACOOL,0
	db "DAVE@",21,SHELLDER,0
	db "HUEY@",17,HORSEA,SHELLDER,TENTACOOL,0
	db "LEWIS@",18,TENTACOOL,STARYU,0
	db "EUGENE@",17,HORSEA,HORSEA,HORSEA,0
	db "FLYNN@",20,MACHOP,0
	db "HANS@",21,PIKACHU,PIKACHU,0
	
CamperData:
	db "DANIEL@",9,DIGLETT,SANDSHREW,0
	db "CRAIG@",14,RATTATA,EKANS,0
	db "HARRY@",18,MANKEY,0
	db "RONALD@",20,SQUIRTLE,0
	db "MARK@",16,SPEAROW,RATICATE,0
	db "MIKE@",18,DIGLETT,DIGLETT,SANDSHREW,0
	db "NICK@",21,GROWLITHE,CHARMANDER,0
	db "ROBERT@",19,RATTATA,DIGLETT,EKANS,SANDSHREW,0
	db "IAN@",29,NIDORAN_M,NIDORINO,0
	
PicnickerData:
	db "CINDY@",19,GOLDEEN,0
	db "DEBRA@",16,RATTATA,PIKACHU,0
	db "HEIDI@",16,PIDGEY,PIDGEY,PIDGEY,0
	db "BROOKE@",22,BULBASAUR,0
	db "LIZ@",18,ODDISH,BELLSPROUT,ODDISH,BELLSPROUT,0
	db "HOPE@",23,MEOWTH,0
	db "KIM@",20,PIKACHU,CLEFAIRY,0
	db "ALICE@",21,PIDGEY,PIDGEOTTO,0
	db "BECKY@",21,JIGGLYPUFF,PIDGEY,MEOWTH,0
	db "CAROL@",22,ODDISH,BULBASAUR,0
	db "DIANA@",24,BULBASAUR,IVYSAUR,0
	db "GINA@",24,PIDGEY,MEOWTH,RATTATA,PIKACHU,MEOWTH,0
	db "JENNY@",30,POLIWAG,POLIWAG,0
	db "CLARA@",27,PIDGEY,MEOWTH,PIDGEY,PIDGEOTTO,0
	db "KELSEY@",28,GOLDEEN,POLIWAG,HORSEA,0
	db "MISSY@",31,GOLDEEN,SEAKING,0
	db "DONNA@",22,BELLSPROUT,CLEFAIRY,0
	db "SUSAN@",20,MEOWTH,ODDISH,PIDGEY,0
	db "NANCI@",19,PIDGEY,RATTATA,RATTATA,BELLSPROUT,0
	db "TINA@",28,GLOOM,ODDISH,ODDISH,0
	db "JULIE@",29,PIKACHU,RAICHU,0
	db "CONNIE@",33,CLEFAIRY,0
	db "WENDY@",29,BELLSPROUT,ODDISH,TANGELA,0
	db "REI@",30,TENTACOOL,HORSEA,SEEL,0
	
PokemaniacData:
	db "TERRY@",30,RHYHORN,LICKITUNG,0
	db "BEN@",20,CUBONE,SLOWPOKE,0
	db "SCOTT@",20,SLOWPOKE,SLOWPOKE,SLOWPOKE,0
	db "JESSY@",22,PIKACHU,CUBONE,0
	db "ANDY@",25,SLOWPOKE,0
	db "JERRY@",40,CHARMELEON,LAPRAS,LICKITUNG,0
	db "BRUCE@",23,CUBONE,SLOWPOKE,0
	
SuperNerdData:
	db "TERU@",11,VOLTORB,VOLTORB,0
	db "ERIC@",16,PIKACHU,EEVEE,0
	db "MARKUS@",20,VOLTORB,KOFFING,VOLTORB,MAGNEMITE,0
	db "ALAN@",22,GRIMER,MUK,GRIMER,0
	db "DEREK@",26,KOFFING,0
	db "CLIF@",22,KOFFING,MAGNEMITE,WEEZING,0
	db "OWEN@",20,MAGNEMITE,MAGNEMITE,KOFFING,MAGNEMITE,0
	db "BEN@",24,MAGNEMITE,VOLTORB,0
	db "RICK@",36,VULPIX,VULPIX,NINETALES,0
	db "MARTY@",34,PONYTA,CHARMANDER,VULPIX,GROWLITHE,0
	db "VINCE@",41,RAPIDASH,0
	db "AVERY@",37,GROWLITHE,VULPIX,0
	
HikerData:
	db "ANTHONY@",10,GEODUDE,MACHOP,ONIX,0
	db "DILLON@",15,MACHOP,GEODUDE,0
	db "RUSSEL@",13,GEODUDE,MANKEY,MACHOP,0
	db "MICHAEL@",17,DIGLETT,ONIX,0
	db "TRENT@",21,GEODUDE,ONIX,0
	db "CLARK@",20,GEODUDE,MACHOP,GEODUDE,0
	db "LENNY@",21,MACHOP,ONIX,0
	db "JAY@",19,ONIX,GRAVELER,0
	db "BRYAN@",21,GEODUDE,GEODUDE,GRAVELER,0
	db "LUCAS@",25,PIDGEOT,0
	db "GEORGE@",20,MACHOP,ONIX,0
	db "DEVAN@",19,GEODUDE,MACHOP,GEODUDE,GEODUDE,0
	db "STEVE@",20,ONIX,ONIX,GEODUDE,0
	db "KURT@",21,GEODUDE,GRAVELER,0
	
BikerData:
	db "CHARLES@",28,KOFFING,GRIMER,EKANS,0
	db "GLENN@",29,RHYHORN,RHYHORN,0
	db "DWAYNE@",25,KOFFING,GRIMER,0
	db "JOEL@",28,GRIMER,VULPIX,0
	db "KYLE@",29,GRIMER,KOFFING,0
	db "BILLY@",33,DITTO,0
	db "ALEX@",26,GRIMER,GRIMER,GRIMER,GRIMER,0
	db "ISAAC@",28,WEEZING,KOFFING,WEEZING,0
	db "JACOB@",33,MUK,0
	db "WESLEY@",29,VOLTORB,MAGNEMITE,0
	db "LOGAN@",29,GROWLITHE,PIDGEY,0
	db "JARED@",25,KOFFING,WEEZING,KOFFING,KOFFING,WEEZING,0
	db "RICK@",26,KOFFING,KOFFING,GRIMER,KOFFING,0
	db "JIMMY@",28,VULPIX,VULPIX,KOFFING,0
	db "REGGIE@",29,PIDGEY,MUK,0
	
BurglarData:
	db "ARNIE@",29,GROWLITHE,VULPIX,0
	db "DUSTY@",33,GROWLITHE,0
	db "PAUL@",28,VULPIX,CHARMANDER,PONYTA,0
	db "SIMON@",36,GROWLITHE,VULPIX,NINETALES,0
	db "DARRYL@",41,PONYTA,0
	db "COREY@",37,VULPIX,GROWLITHE,0
	db "EDDIE@",34,CHARMANDER,CHARMELEON,0
	db "DUNCAN@",38,NINETALES,0
	db "ISAIAH@",34,GROWLITHE,PONYTA,0
	
EngineerData:
	db "BERNIE@",21,MAGNEMITE,PIKACHU,0
	db "FLINT@",21,MAGNEMITE,PIKACHU,0
	db "JACK@",18,MAGNEMITE,PIKACHU,0

CoupleData: 
	db "MIKE & NAT@",$FF,20,CUBONE,16,WEEPINBELL,0

FisherData:
	db "WALT@",17,GOLDEEN,TENTACOOL,GOLDEEN,0
	db "CHRIS@",17,TENTACOOL,STARYU,SHELLDER,0
	db "CRAIG@",22,GOLDEEN,POLIWAG,GOLDEEN,0
	db "BILL@",24,TENTACOOL,GOLDEEN,0
	db "HANK@",27,GOLDEEN,0
	db "BRAD@",21,POLIWAG,SHELLDER,GOLDEEN,HORSEA,0
	db "JIMMY@",28,SEAKING,GOLDEEN,SEAKING,SEAKING,0
	db "RALPH@",31,SHELLDER,CLOYSTER,0
	db "BOB@",27,MAGIKARP,MAGIKARP,MAGIKARP,MAGIKARP,MAGIKARP,MAGIKARP,0
	db "JOE@",33,SEAKING,GOLDEEN,0
	db "WILTON@",24,MAGIKARP,MAGIKARP,0
	
SwimmerData:
	db "GEORGE@",16,HORSEA,SHELLDER,0
	db "BRUNO@",30,TENTACOOL,SHELLDER,0
	db "CHARLIE@",29,GOLDEEN,HORSEA,STARYU,0
	db "ROBERT@",30,POLIWAG,POLIWHIRL,0
	db "CHRIS@",27,HORSEA,TENTACOOL,TENTACOOL,GOLDEEN,0
	db "RILEY@",29,GOLDEEN,SHELLDER,SEAKING,0
	db "JOHN@",30,HORSEA,HORSEA,0
	db "ABE@",27,TENTACOOL,TENTACOOL,STARYU,HORSEA,TENTACRUEL,0
	db "MATTHEW@",31,SHELLDER,CLOYSTER,0
	db "KIRK@",35,STARYU,0
	db "PARKER@",28,HORSEA,HORSEA,SEADRA,HORSEA,0
	db "ROSS@",33,SEADRA,TENTACRUEL,0
	db "PERRY@",37,STARMIE,0
	db "RYAN@",33,STARYU,WARTORTLE,0
	db "BEN@",32,PIKACHU,GYARADOS,STARMIE,0
	db "JOSIAH@",31,TENTACOOL,TENTACOOL,TENTACRUEL,0
	
CueBallData:
	db "CHANCE@",28,MACHOP,MANKEY,MACHOP,0
	db "DAVE@",29,MANKEY,MACHOP,0
	db "CHAD@",33,MACHOP,0
	db "SCOTT@",29,MANKEY,PRIMEAPE,0
	db "NICK@",29,MACHOP,MACHOKE,0
	db "REESE@",33,MACHOKE,0
	db "KENNY@",26,MANKEY,MANKEY,MACHOKE,MACHOP,0
	db "BRUCE@",29,PRIMEAPE,MACHOKE,0
	
GamblerData:
	db "STAN@",18,POLIWAG,HORSEA,0
	db "RICH@",18,BELLSPROUT,ODDISH,0
	db "DIRK@",18,VOLTORB,MAGNEMITE,0
	db "JASPER@",18,GROWLITHE,VULPIX,0
	db "PHIL@",22,POLIWAG,POLIWAG,POLIWHIRL,0
	db "BIFF@",22,ONIX,GEODUDE,GRAVELER,0
	db "JOEL@",24,GROWLITHE,VULPIX,0
	
SwimmerFData:
BeautyData:
	db "NIKKI@",21,ODDISH,BELLSPROUT,ODDISH,BELLSPROUT,0
	db "BETH@",24,BELLSPROUT,BELLSPROUT,0
	db "SELENA@",26,EXEGGCUTE,0
	db "ARIANA@",27,RATTATA,PIKACHU,RATTATA,0
	db "CALLIE@",29,CLEFAIRY,MEOWTH,0
	db "MALENA@",35,SEAKING,0
	db "BREA@",30,SHELLDER,SHELLDER,CLOYSTER,0
	db "KAYLEE@",31,POLIWAG,SEAKING,0
	db "LYNN@",29,PIDGEOTTO,WIGGLYTUFF,0
	db "HOLLY@",29,BULBASAUR,IVYSAUR,0
	db "CARLY@",33,WEEPINBELL,BELLSPROUT,WEEPINBELL,0
	db "KIERA@",27,POLIWAG,GOLDEEN,SEAKING,GOLDEEN,POLIWAG,0
	db "MANDY@",30,GOLDEEN,SEAKING,0
	db "ANNA@",29,STARYU,STARYU,STARYU,0
	db "CAITLYN@",30,SEADRA,HORSEA,SEADRA,0
	db "ARIEL@",19,GOLDEEN,0 ; Misty's Gym, Trainer # 0x10
	db "CALLIE@",30,TENTACOOL,HORSEA,SEEL,0 ; Route 20, Trainer # 0x11
	db "MARIE@",31,GOLDEEN,SEAKING,0 ; Route 20, Trainer # 0x12
	
PsychicData:
	db "YURI@",31,KADABRA,SLOWPOKE,MR_MIME,KADABRA,0
	db "TERU@",34,MR_MIME,KADABRA,0
	db "KIO@",33,SLOWPOKE,SLOWBRO,SLOWBRO,0
	db "RHEN@",38,SLOWBRO,0
	
RockerData:
	db "DEBBIE@",20,VOLTORB,VOLTORB,VOLTORB,0
	db "C.C.@",29,VOLTORB,ELECTRODE,0
	
JugglerData:
	db "IRWIN@",29,KADABRA,MR_MIME,0
	db "HORTON@",41,DROWZEE,HYPNO,KADABRA,KADABRA,0
	db "FRITZ@",31,DROWZEE,DROWZEE,KADABRA,DROWZEE,0
	db "LIAM@",34,DROWZEE,HYPNO,0
	db "CLOYD@",48,MR_MIME,0
	db "DEREK@",33,HYPNO,0
	db "WILL@",38,HYPNO,0
	db "SHAWN@",34,DROWZEE,KADABRA,0
	
TamerData:
	db "COLE@",34,SANDSLASH,ARBOK,0
	db "EDGAR@",33,ARBOK,SANDSLASH,ARBOK,0
	db "EVAN@",43,RHYHORN,0
	db "JASON@",39,ARBOK,TAUROS,0
	db "PHIL@",44,PERSIAN,GOLDUCK,0
	db "VINCE@",42,RHYHORN,PRIMEAPE,ARBOK,TAUROS,0
	
BirdKeeperData:
	db "ROD@",29,PIDGEY,PIDGEOTTO,0
	db "ABE@",25,SPEAROW,PIDGEY,PIDGEY,SPEAROW,SPEAROW,0
	db "BOB@",26,PIDGEY,PIDGEOTTO,SPEAROW,FEAROW,0
	db "HANK@",33,FARFETCH_D,0
	db "BRET@",29,SPEAROW,FEAROW,0
	db "ROY@",26,PIDGEOTTO,FARFETCH_D,DODUO,PIDGEY,0
	db "TOBY@",28,DODRIO,DODUO,DODUO,0
	db "CHAD@",29,SPEAROW,FEAROW,0
	db "MIKE@",34,DODRIO,0
	db "KYLE@",26,SPEAROW,SPEAROW,FEAROW,SPEAROW,0
	db "WILLY@",30,FEAROW,FEAROW,PIDGEOTTO,0
	db "JEFF@",39,PIDGEOTTO,PIDGEOTTO,PIDGEY,PIDGEOTTO,0
	db "TROY@",42,FARFETCH_D,FEAROW,0
	db "KEVIN@",28,PIDGEY,DODUO,PIDGEOTTO,0
	db "JIM@",26,PIDGEY,SPEAROW,PIDGEY,FEAROW,0
	db "ERIC@",29,PIDGEOTTO,FEAROW,0
	db "CHRIS@",28,SPEAROW,PIDGEY,FEAROW,0
	
BlackbeltData:
	db "KENJI@",37,HITMONLEE,HITMONCHAN,0
	db "LAO@",31,MANKEY,MANKEY,PRIMEAPE,0
	db "HUNG@",32,MACHOP,MACHOKE,0
	db "CHANG@",36,PRIMEAPE,0
	db "TORU@",31,MACHOP,MANKEY,PRIMEAPE,0
	db "YOSHI@",40,MACHOP,MACHOKE,0
	db "WANG@",43,MACHOKE,0
	db "NOB@",38,MACHOKE,MACHOP,MACHOKE,0
	db "WAI@",43,MACHOKE,MACHOP,MACHOKE,0
	
GentlemanData:
	db "ALFRED@",18,GROWLITHE,GROWLITHE,0
	db "EDWARD@",19,NIDORAN_M,NIDORAN_F,0
	db "PRESTON@",23,PIKACHU,0
	db "GREGORY@",48,PRIMEAPE,0
	db "HOWARD@",17,GROWLITHE,PONYTA,0	
	
ChannelerData:
	db "AMELIA@",22,GASTLY,0
	db "SELENE@",24,GASTLY,0
	db "KARINA@",23,GASTLY,GASTLY,0
	db "HOPE@",24,HAUNTER,0
	db "STACY@",23,GASTLY,0
	db "GWEN@",24,GASTLY,0
	db "MARY@",24,HAUNTER,0
	db "JANE@",22,GASTLY,0
	db "CARLY@",24,GASTLY,0
	db "TRIXIE@",23,GASTLY,GASTLY,0
	db "JODIE@",24,HAUNTER,0
	db "FAITH@",22,GASTLY,0
	db "ALICE@",24,GASTLY,0
	db "ASHE@",23,HAUNTER,0
	db "HOLLY@",24,GASTLY,0
	db "CINDY@",22,GASTLY,0
	db "GRACE@",24,GASTLY,0
	db "REI@",22,GASTLY,0
	db "LEAH@",22,GASTLY,GASTLY,GASTLY,0
	db "EVE@",24,GASTLY,0
	db "CASSIE@",24,GASTLY,0
	
ScientistData:
	db "SHELDON@",34,KOFFING,VOLTORB,0
	db "ROSS@",26,GRIMER,WEEZING,KOFFING,WEEZING,0
	db "MITCH@",28,MAGNEMITE,VOLTORB,MAGNETON,0
	db "JED@",29,ELECTRODE,WEEZING,0
	db "MARC@",33,ELECTRODE,0
	db "TAYLOR@",26,MAGNETON,KOFFING,WEEZING,MAGNEMITE,0
	db "NICK@",25,VOLTORB,KOFFING,MAGNETON,MAGNEMITE,KOFFING,0
	db "KEVIN@",29,ELECTRODE,MUK,0
	db "HOWIE@",29,GRIMER,ELECTRODE,0
	db "BRIAN@",28,VOLTORB,KOFFING,MAGNETON,0
	db "ALEX@",29,MAGNEMITE,KOFFING,0
	db "JUSTIN@",33,MAGNEMITE,MAGNETON,VOLTORB,0
	db "CHRIS@",34,MAGNEMITE,ELECTRODE,0
	
RocketFData:
RocketData:
	db "GRUNT@",15,RATTATA,ZUBAT,0 
	db "GRUNT@",11,SANDSHREW,RATTATA,ZUBAT,0
	db "GRUNT@",13,ZUBAT,EKANS,0
	db "GRUNT@",14,RATICATE,0
	db "GRUNT@",17,MACHOP,DROWZEE,0
	db "GRUNT@",15,EKANS,ZUBAT,0 ; Nugget Bridge "Boss"
	db "GRUNT@",20,RATICATE,ZUBAT,0
	db "GRUNT@",21,DROWZEE,MACHOP,0
	db "GRUNT@",21,RATICATE,RATICATE,0
	db "GRUNT@",20,GRIMER,KOFFING,KOFFING,0
	db "GRUNT@",19,RATTATA,RATICATE,RATICATE,RATTATA,0
	db "GRUNT@",22,GRIMER,KOFFING,0
	db "GRUNT@",17,ZUBAT,KOFFING,GRIMER,ZUBAT,RATICATE,0
	db "GRUNT@",20,RATTATA,RATICATE,DROWZEE,0
	db "GRUNT@",21,MACHOP,MACHOP,0
	db "GRUNT@",23,SANDSHREW,EKANS,SANDSLASH,0
	db "GRUNT@",23,EKANS,SANDSHREW,ARBOK,0
	db "GRUNT@",21,KOFFING,ZUBAT,0
	db "GRUNT@",25,ZUBAT,ZUBAT,GOLBAT,0
	db "GRUNT@",26,KOFFING,DROWZEE,0
	db "GRUNT@",26,KOFFING,DROWZEE,0
	db "GRUNT@",26,DROWZEE,KOFFING,0
	db "GRUNT@",29,CUBONE,ZUBAT,0
	db "GRUNT@",25,GOLBAT,ZUBAT,ZUBAT,RATICATE,ZUBAT,0
	db "GRUNT@",28,RATICATE,HYPNO,RATICATE,0
	db "GRUNT@",29,MACHOP,DROWZEE,0
	db "GRUNT@",28,EKANS,ZUBAT,CUBONE,0
	db "GRUNT@",33,ARBOK,0
	db "GRUNT@",33,HYPNO,0
	db "GRUNT@",29,MACHOP,MACHOKE,0
	db "GRUNT@",28,ZUBAT,ZUBAT,GOLBAT,0
	db "GRUNT@",26,RATICATE,ARBOK,KOFFING,GOLBAT,0
	db "GRUNT@",29,CUBONE,CUBONE,0
	db "GRUNT@",29,SANDSHREW,SANDSLASH,0
	db "GRUNT@",26,RATICATE,ZUBAT,GOLBAT,RATTATA,0
	db "GRUNT@",28,WEEZING,GOLBAT,KOFFING,0
	db "GRUNT@",28,DROWZEE,GRIMER,MACHOP,0
	db "GRUNT@",28,GOLBAT,DROWZEE,HYPNO,0
	db "GRUNT@",33,MACHOKE,0
	db "GRUNT@",25,RATTATA,RATTATA,ZUBAT,RATTATA,EKANS,0
	db "GRUNT@",32,CUBONE,DROWZEE,MAROWAK,0
	
AceTrainerMData:
	db "AARON@",39,NIDORINO,NIDOKING,0
	db "BLAKE@",43,EXEGGUTOR,CLOYSTER,ARCANINE,0
	db "BRIAN@",43,KINGLER,TENTACRUEL,BLASTOISE,0
	db "CODY@",45,KINGLER,STARMIE,0
	db "GAVEN@",42,IVYSAUR,WARTORTLE,CHARMELEON,CHARIZARD,0
	db "JAKE@",44,IVYSAUR,WARTORTLE,CHARMELEON,0
	db "DANNY@",49,NIDOKING,0
	db "MIKE@",44,KINGLER,CLOYSTER,0
	db "NICK@",39,SANDSLASH,DUGTRIO,0
	db "ZORO@",43,RHYHORN,0
	
AceTrainerFData:
	db "BETH@",24,WEEPINBELL,GLOOM,IVYSAUR,0
	db "LOLA@",43,BELLSPROUT,WEEPINBELL,VICTREEBEL,0
	db "MEGAN@",43,PARASECT,DEWGONG,CHANSEY,0
	db "QUINN@",46,VILEPLUME,BUTTERFREE,0
	db "IRENE@",44,PERSIAN,NINETALES,0
	db "SARA@",45,IVYSAUR,VENUSAUR,0
	db "LISA@",45,NIDORINA,NIDOQUEEN,0
	db "ANNA@",43,PERSIAN,NINETALES,RAICHU,0
	
