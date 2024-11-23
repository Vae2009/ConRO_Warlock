local ConRO_Warlock, ids = ...;

--Generic
	ids.Racial = {
		AncestralCall = {spellID = 274738},
		ArcanePulse = {spellID = 260364},
		ArcaneTorrent = {spellID = 50613},
		Berserking = {spellID = 26297},
		Cannibalize = {spellID = 20577},
	}
	ids.HeroSpec = {
		SoulHarvester = 57,
		Hellcaller = 58,
		Diabolist = 59,
	}

--Warlock
	ids.Warlock_Ability = {
		DrainLife = {spellID = 234153},
		Corruption = {spellID = 172},
		CreateHealthstone = {spellID = 6201},
			Healthstone = 5512,
		CurseofWeakness = {spellID = 702},
		Fear = {spellID = 5782},
		HealthFunnel = {spellID = 755},
		ShadowBolt = {spellID = 686},
		SummonDemon = {spellID = 10},
			SummonImp = {spellID = 688},
			SummonVoidwalker = {spellID = 697},
		UnendingResolve = {spellID = 104773},
	}
	ids.Warlock_Passive = {
		SoulShards = 246985,
	}
	ids.Warlock_Debuff = {
		Corruption = 146739,
	}

--Affliction
	ids.Aff_Ability = {
	--Warlock Baseline
		CommandDemon = {
			CauterizeMaster = {spellID = 119905}, --Imp
			Suffering = {spellID = 119907}, --Voidwalker
			Whiplash = {spellID = 119909}, --Succubus
			SpellLock = {spellID = 119910}, --Felhunter
			ShadowLock = {spellID = 171140}, --Doomguard
			MeteorStrike = {spellID = 171152}, --Infernal
		},
		Corruption = {spellID = 172},
		CurseofWeakness = {spellID = 702},
		DrainLife = {spellID = 234153},
		EyeofKilrogg = {spellID = 126},
		Fear = {spellID = 5782},
		HealthFunnel = {spellID = 755},
		Healthstone = {
			Create = {spellID = 6201},
			CreateSoulwell = {spellID = 29893},
			Use = 5512,
		},
		RitualofDoom = {spellID = 342601},
		RitualofSummoning = {spellID = 698},
		ShadowBolt = {spellID = 686},
		Soulstone = {spellID = 20707},
		SubjugateDemon = {spellID = 1098},
		SummonDemon = {
			Imp = {spellID = 688},
			Voidwalker = {spellID = 697},
			Felhunter = {spellID = 691},
			Succubus = {spellID = 712},
			Felguard = {spellID = 30146},
		},
		UnendingBreath = {spellID = 5697},
		UnendingResolve = {spellID = 104773},
		--Passive
		SoulShards = {spellID = 246985},
	--Affliction Baseline
		Agony = {spellID = 980},
		MaleficRapture = {spellID = 324536},
		--Passive
		MasteryPotentAfflictions = {spellID = 77215},
		XavianTeachings = {spellID = 317031},
	--Warlock
		FelDomination = {spellID = 333889, talentID = 91439},
		SoulLeech = {spellID = 108370, talentID = 91441},
		BurningRush = {spellID = 111400, talentID = 91460},
		FelPact = {spellID = 386113, talentID = 91440},
		DemonSkin = {spellID = 219272, talentID = 91463},
		FelArmor = {spellID = 386124, talentID = 91461},
		FiendishStride = {spellID = 386110, talentID = 91459},
		CursesofEnfeeblement = {spellID = 386105, talentID = 91462},
			CurseofExhaustion = {spellID = 334275, talentID = 91462},
			CurseofTongues = {spellID = 1714, talentID = 91462},
		DemonicCircle = {
			Summon = {spellID = 48018, talentID = 124694},
			Teleport = {spellID = 48020, talentID = 124694},
			},
		HowlofTerror = {spellID = 5484, talentID = 91458},
		MortalCoil = {spellID = 6789, talentID = 91457},
		AmplifyCurse = {spellID = 328774, talentID = 91442},
		DemonicEmbrace = {spellID = 288843, talentID = 91438},
		DemonicInspiration = {spellID = 386858, talentID = 91436},
		AbyssWalker = {spellID = 389609, talentID = 91465},
		WrathfulMinion = {spellID = 386864, talentID = 91456},
		DemonicFortitude = {spellID = 386617, talentID = 91430},
		Banish = {spellID = 710, talentID = 91454},
		TeachingsoftheSatyr = {spellID = 387972, talentID = 91443},
		AccruedVitality = {spellID = 386613, talentID = 91464},
		SweetSouls = {spellID = 386620, talentID = 91435},
		Nightmare = {spellID = 386648, talentID = 91422},
		Horrify = {spellID = 56244, talentID = 115459},
		DemonicGateway = {spellID = 111771, talentID = 91466},
		Lifeblood = {spellID = 386646, talentID = 91449},
		DarkPact = {spellID = 108416, talentID = 91444},
		StrengthofWill = {spellID = 317138, talentID = 91468},
		DarkAccord = {spellID = 386659, talentID = 91467},
		Shadowfury = {spellID = 30283, talentID = 91452},
		IchorofDevils = {spellID = 386664, talentID = 91446},
		FrequentDonor = {spellID = 386686, talentID = 91445},
		SocretharsGuile = {spellID = 405936, talentID = 115461},
		SargereiTechnique = {spellID = 405955, talentID = 115462},
		Darkfury = {spellID = 264874, talentID = 91451},
		Shadowflame = {spellID = 384069, talentID = 91450},
		SwiftArtifice = {spellID = 452902, talentID = 91425},
		DemonicTactics = {spellID = 452894, talentID = 91433},
		TeachingsoftheBlackHarvest = {spellID = 385881, talentID = 91447},
		ResoluteBarrier = {spellID = 389359, talentID = 91421},
		FelSynergy = {spellID = 389367, talentID = 91432},
		SoulLink = {spellID = 108415, talentID = 91431},
		DemonicResilience = {spellID = 389590, talentID = 91424},
		PactofGluttony = {spellID = 386689, talentID = 91434},
			DemonicHealthstone = {spellID = 224464, talentID = 91434},
		SoulConduit = {spellID = 215941, talentID = 91427},
		Soulburn = {spellID = 385899, talentID = 91469},
	--Affliction
		UnstableAffliction = {spellID = 316099, talentID = 91570},
		WritheinAgony = {spellID = 196102, talentID = 91569},
		SeedofCorruption = {spellID = 27243, talentID = 91571},
		DarkVirtuosity = {spellID = 405327, talentID = 91564},
		AbsoluteCorruption = {spellID = 196103, talentID = 91572},
		SiphonLife = {spellID = 452999, talentID = 124693},
		KindledMalice = {spellID = 405330, talentID = 91561},
		Nightfall = {spellID = 108558, talentID = 91568},
		VolatileAgony = {spellID = 453034, talentID = 91560},
		ImprovedShadowBolt = {spellID = 453080, talentID = 91566},
		DrainSoulPassive = {spellID = 388667, talentID = 124692},
			DrainSoul = {spellID = 198590, talentID = 124692},
		SummonersEmbrace = {spellID = 453105, talentID = 91558},
		GrimoireofSacrifice = {spellID = 108503, talentID = 124691},
		VileTaint = {spellID = 278350, talentID = 91556},
		PhantomSingularity = {spellID = 205179, talentID = 126061},
		Haunt = {spellID = 48181, talentID = 91552},
		ShadowEmbrace = {spellID = 32388, talentID = 124690},
		SacrolashsDarkStrike = {spellID = 386986, talentID = 91575},
		SummonDarkglare = {spellID = 205180, talentID = 91554},
		CunningCruelty = {spellID = 453172, talentID = 91576},
		Infirmity = {spellID = 458036, talentID = 126065},
		ImprovedHaunt = {spellID = 458034, talentID = 126064},
		Malediction = {spellID = 453087, talentID = 91567},
		MalevolentVisionary = {spellID = 387273, talentID = 91504},
		Contagion = {spellID = 453096, talentID = 91562},
		CulltheWeak = {spellID = 453056, talentID = 91559},
		CreepingDeath = {spellID = 264000, talentID = 91580},
		SoulRot = {spellID = 386997, talentID = 91578},
		TormentedCrescendo = {spellID = 387075, talentID = 91551},
		XaviusGambit = {spellID = 416615, talentID = 91429},
		FocusedMalignancy = {spellID = 399668, talentID = 91563},
		PerpetualUnstability = {spellID = 459376, talentID = 126302},
		MalignOmen = {spellID = 458041, talentID = 91579},
		Relinquished = {spellID = 453083, talentID = 91573},
		WitheringBolt = {spellID = 386976, talentID = 91577},
		ImprovedMaleficRapture = {spellID = 454378, talentID = 91555},
		Oblivion = {spellID = 417537, talentID = 91503},
		DeathsEmbrace = {spellID = 453189, talentID = 91553},
		DarkHarvest = {spellID = 387016, talentID = 126062},
		RavenousAfflictions = {spellID = 459440, talentID = 126303},
		MaleficTouch = {spellID = 458029, talentID = 126063},
	--Hero
	--Hellcaller
		Wither = {spellID = 445468, talentID = 117437},
		XalansFerocity = {spellID = 440044, talentID = 117450},
		BlackenedSoul = {spellID = 440043, talentID = 117434},
		XalansCruelty = {spellID = 440040, talentID = 117442},
		CurseoftheSatyr = {spellID = 440057, talentID = 117419},
		AuraofEnfeeblement = {spellID = 440059, talentID = 123309},
		HatefuryRituals = {spellID = 440048, talentID = 117451},
		BleakheartTactics = {spellID = 440051, talentID = 123310},
		ZevrimsResilience = {spellID = 440065, talentID = 117432},
		IllhoofsDesign = {spellID = 440070, talentID = 123308},
		MarkofXavius = {spellID = 440046, talentID = 117431},
		SeedsofTheirDemise = {spellID = 440055, talentID = 117426},
		MarkofPerotharn = {spellID = 440045, talentID = 117441},
		Malevolence = {spellID = 442726, talentID = 117439},
	--Soul Harvester
		DemonicSoul = {spellID = 449614, talentID = 117448},
		NecrolyteTeachings = {spellID = 449620, talentID = 117422},
		SoulAnathema = {spellID = 449624, talentID = 117444},
		DemoniacsFervor = {spellID = 449629, talentID = 117429},
		GoreboundFortitude = {spellID = 449701, talentID = 117447},
		FriendsInDarkPlaces = {spellID = 449703, talentID = 123840},
		SharedFate = {spellID = 449704, talentID = 117420},
		FeastofSouls = {spellID = 449706, talentID = 123839},
		EternalServitude = {spellID = 449707, talentID = 117421},
		GorefiendsResolve = {spellID = 389623, talentID = 123838},
		WickedReaping = {spellID = 449631, talentID = 117418},
		Quietus = {spellID = 449634, talentID = 117443},
		SataielsVolition = {spellID = 449637, talentID = 117435},
		ShadowofDeath = {spellID = 449638, talentID = 117454},
	}
	ids.Aff_PvPTalent = {
		BaneofFragility = {spellID = 199954},
		Deathbolt = {spellID = 264106},
		GatewayMastery = {spellID = 248855},
		RotandDecay = {spellID = 212371},
		BaneofShadows = {spellID = 234877},
		NetherWard = {spellID = 212295},
		EssenceDrain = {spellID = 221711},
		CastingCircle = {spellID = 221703},
		DemonArmor = {spellID = 285933},
		AmplifyCurse = {spellID = 328774},
		RampantAfflictions = {spellID = 335052},
			UnstableAfflictionRA = {spellID = 342938, talentID = 335052},
	}
	ids.Aff_Form = {

	}
	ids.Aff_Buff = {
		BurningRush = 111400,
		DarkPact = 108416,
		GrimoireofSacrifice = 196099,
		Nightfall = 264571,
		TormentedCrescendo = 387079,
	}
	ids.Aff_Debuff = {
		Agony = 980,
		Corruption = 146739,
		DrainSoul = 198590,
		Haunt = 48181,
		PhantomSingularity = 205179,
		SeedofCorruption = 27243,
		ShadowEmbrace = 32390,
		UnstableAffliction = 316099,
		UnstableAfflictionRA = 342938,
		VileTaint = 278350,
		Wither = 445474,
	}
	ids.Aff_PetAbility = {
		CauterizeMaster = {spellID = 119899}, --Imp
		Suffering = {spellID = 17735}, --Voidwalker
		Whiplash = {spellID = 6360}, --Succubus
		SpellLock = {spellID = 19647}, --Felhunter
		DevourMagic = {spellID = 19505}, --Felhunter
		MeteorStrike = {spellID = 171017}, --Infernal	
		ThreateningPresence = {spellID = 112042}, -- Voidwalker
		Felstorm = {spellID = 89751}, -- Felguard
		AxeToss = {spellID = 89766},
	}

--Demonology
	ids.Demo_Ability = {
	--Warlock Baseline
		CommandDemon = {
			SingeMagic = {spellID = 119905}, --Imp
			Suffering = {spellID = 119907}, --Voidwalker
			Whiplash = {spellID = 119909}, --Succubus
			SpellLock = {spellID = 119910}, --Felhunter
			ShadowLock = {spellID = 171140}, --Doomguard
			MeteorStrike = {spellID = 171152}, --Infernal
			AxeToss = {spellID = 119914}, --Felguard
		},
		Corruption = {spellID = 172},
		CurseofWeakness = {spellID = 702},
		DrainLife = {spellID = 234153},
		EyeofKilrogg = {spellID = 126},
		Fear = {spellID = 5782},
		HealthFunnel = {spellID = 755},
		Healthstone = {
			Create = {spellID = 6201},
			CreateSoulwell = {spellID = 29893},
			Use = 5512,
		},
		RitualofDoom = {spellID = 342601},
		RitualofSummoning = {spellID = 698},
		ShadowBolt = {spellID = 686},
		Soulstone = {spellID = 20707},
		SubjugateDemon = {spellID = 1098},
		SummonDemon = {
			Imp = {spellID = 688},
			Voidwalker = {spellID = 697},
			Felhunter = {spellID = 691},
			Succubus = {spellID = 712},
			Felguard = {spellID = 30146},
		},
		UnendingBreath = {spellID = 5697},
		UnendingResolve = {spellID = 104773},
		--Passive
		SoulShards = {spellID = 246985},
	--Demonology Baseline
		HandofGuldan = {spellID = 105174},
		--Passive
		MasteryMasterDemonologist = {spellID = 77219},
	--Warlock
		FelDomination = {spellID = 333889, talentID = 91439},
		SoulLeech = {spellID = 108370, talentID = 91441},
		BurningRush = {spellID = 111400, talentID = 91460},
		FelPact = {spellID = 386113, talentID = 91440},
		DemonSkin = {spellID = 219272, talentID = 91463},
		FelArmor = {spellID = 386124, talentID = 91461},
		FiendishStride = {spellID = 386110, talentID = 91459},
		CursesofEnfeeblement = {spellID = 386105, talentID = 91462},
			CurseofExhaustion = {spellID = 334275, talentID = 91462},
			CurseofTongues = {spellID = 1714, talentID = 91462},
		DemonicCircle = {
			Summon = {spellID = 48018, talentID = 124694},
			Teleport = {spellID = 48020, talentID = 124694},
			},
		HowlofTerror = {spellID = 5484, talentID = 91458},
		MortalCoil = {spellID = 6789, talentID = 91457},
		AmplifyCurse = {spellID = 328774, talentID = 91442},
		DemonicEmbrace = {spellID = 288843, talentID = 91438},
		DemonicInspiration = {spellID = 386858, talentID = 91436},
		AbyssWalker = {spellID = 389609, talentID = 91465},
		WrathfulMinion = {spellID = 386864, talentID = 91456},
		DemonicFortitude = {spellID = 386617, talentID = 91430},
		Banish = {spellID = 710, talentID = 91454},
		TeachingsoftheSatyr = {spellID = 387972, talentID = 91443},
		AccruedVitality = {spellID = 386613, talentID = 91464},
		SweetSouls = {spellID = 386620, talentID = 91435},
		Nightmare = {spellID = 386648, talentID = 91422},
		Horrify = {spellID = 56244, talentID = 115459},
		DemonicGateway = {spellID = 111771, talentID = 91466},
		Lifeblood = {spellID = 386646, talentID = 91449},
		DarkPact = {spellID = 108416, talentID = 91444},
		StrengthofWill = {spellID = 317138, talentID = 91468},
		DarkAccord = {spellID = 386659, talentID = 91467},
		Shadowfury = {spellID = 30283, talentID = 91452},
		IchorofDevils = {spellID = 386664, talentID = 91446},
		FrequentDonor = {spellID = 386686, talentID = 91445},
		SocretharsGuile = {spellID = 405936, talentID = 115461},
		SargereiTechnique = {spellID = 405955, talentID = 115462},
		Darkfury = {spellID = 264874, talentID = 91451},
		Shadowflame = {spellID = 384069, talentID = 91450},
		SwiftArtifice = {spellID = 452902, talentID = 91425},
		DemonicTactics = {spellID = 452894, talentID = 91433},
		TeachingsoftheBlackHarvest = {spellID = 385881, talentID = 91447},
		ResoluteBarrier = {spellID = 389359, talentID = 91421},
		FelSynergy = {spellID = 389367, talentID = 91432},
		SoulLink = {spellID = 108415, talentID = 91431},
		DemonicResilience = {spellID = 389590, talentID = 91424},
		PactofGluttony = {spellID = 386689, talentID = 91434},
			DemonicHealthstone = {spellID = 224464, talentID = 91434},
		SoulConduit = {spellID = 215941, talentID = 91427},
		Soulburn = {spellID = 385899, talentID = 91469},
	--Demonology
		Demoniac = {spellID = 426115, talentID = 125834},
			Demonbolt = {spellID = 264178, talentID = 125834},
			DemonicCore = {spellID = 267102, talentID = 125834},
		Implosion = {spellID = 196277, talentID = 125836},
		CallDreadstalkers = {spellID = 104316, talentID = 125837},
		ImpGangBoss = {spellID = 387445, talentID = 125868},
		SpitefulReconstitution = {spellID = 428394, talentID = 125846},
		Dreadlash = {spellID = 264078, talentID = 125830},
		CarnivorousStalkers = {spellID = 386194, talentID = 125829},
		InnerDemons = {spellID = 267216, talentID = 125871},
		SoulStrike = {spellID = 428344, talentID = 125844},
		BilescourgeBombers = {spellID = 267211, talentID = 125833},
		DemonicStrength = {spellID = 267171, talentID = 125832},
		SacrificedSouls = {spellID = 267214, talentID = 125828},
		RuneofShadows = {spellID = 453744, talentID = 125860},
		Imperator = {spellID = 416230, talentID = 125869},
		FelInvocation = {spellID = 428351, talentID = 125842},
		AnnihilanTraining = {spellID = 386174, talentID = 125826},
		ShadowInvocation = {spellID = 422054, talentID = 125867},
		WickedMaw = {spellID = 267170, talentID = 125872},
		PowerSiphon = {spellID = 264130, talentID = 125862},
		SummonDemonicTyrant = {spellID = 265187, talentID = 125850},
		GrimoireFelguard = {spellID = 111898, talentID = 125852},
		TheExpendables = {spellID = 387600, talentID = 125847},
		BloodInvocation = {spellID = 455576, talentID = 125849},
		UmbralBlaze = {spellID = 405798, talentID = 125861},
		ReignofTyranny = {spellID = 427684, talentID = 125854},
		DemonicCalling = {spellID = 205145, talentID = 125848},
		FiendishOblation = {spellID = 455569, talentID = 125858},
		FelSunder = {spellID = 387399, talentID = 125857},
		Doom = {spellID = 460551, talentID = 125865},
		PactoftheImpMother = {spellID = 387541, talentID = 125870},
		SummonVilefiend = {spellID = 264119, talentID = 125845},
		DreadCalling = {spellID = 387391, talentID = 125831},
		AntoranArmaments = {spellID = 387494, talentID = 125859},
		DoomEternal = {spellID = 455585, talentID = 125851},
		ImpendingDoom = {spellID = 455587, talentID = 125827},
		FoulMouth = {spellID = 455502, talentID = 125864},
		TheHoundmastersGambit = {spellID = 455572, talentID = 125843},
		ImprovedDemonicTactics = {spellID = 453800, talentID = 125835},
		DemonicBrutality = {spellID = 453908, talentID = 125866},
		PactoftheEredruin = {spellID = 453568, talentID = 125863},
		Shadowtouched = {spellID = 453619, talentID = 125856},
		MarkofShatug = {spellID = 455449, talentID = 125839},
			SummonGloodhound = {spellID = 455465, talentID = 125839},
		MarkofFharg = {spellID = 455450, talentID = 125838},
			SummonCharhound = {spellID = 455476, talentID = 125838},
		Flametouched = {spellID = 453699, talentID = 125855},
		ImmutableHatred = {spellID = 405670, talentID = 125841},
		Guillotine = {spellID = 386833, talentID = 125840},
	--Hero
	--Diabolist
		DiabolicRitual = {spellID = 428514, talentID = 117452},
		ClovenSouls = {spellID = 428517, talentID = 117446},
		TouchofRancora = {spellID = 429893, talentID = 117453},
		SecretsoftheCoven = {spellID = 428518, talentID = 117423},
			InfernalBolt = {spellID = 434506, talentID = 117423},
		SoulEtchedCircles = {spellID = 428911, talentID = 117433},
		AnnihilansBellow = {spellID = 429072, talentID = 118837},
		CrueltyofKerxan = {spellID = 429902, talentID = 117445},
		InfernalMachine = {spellID = 429917, talentID = 118838},
		InfernalVitality = {spellID = 429115, talentID = 117449},
		InfernalBulwark = {spellID = 429130, talentID = 118839},
		FlamesofXoroth = {spellID = 429657, talentID = 117430},
		AbyssalDominion = {spellID = 429581, talentID = 117428},
		GloomofNathreza = {spellID = 429899, talentID = 117440},
		RuinationPassive = {spellID = 428522, talentID = 117427},
			Ruination = {spellID = 434635, talentID = 117427},
	--Soul Harvester
		DemonicSoul = {spellID = 449614, talentID = 117448},
		NecrolyteTeachings = {spellID = 449620, talentID = 117422},
		SoulAnathema = {spellID = 449624, talentID = 117444},
		DemoniacsFervor = {spellID = 449629, talentID = 117429},
		GoreboundFortitude = {spellID = 449701, talentID = 117447},
		FriendsInDarkPlaces = {spellID = 449703, talentID = 123840},
		SharedFate = {spellID = 449704, talentID = 117420},
		FeastofSouls = {spellID = 449706, talentID = 123839},
		EternalServitude = {spellID = 449707, talentID = 117421},
		GorefiendsResolve = {spellID = 389623, talentID = 123838},
		WickedReaping = {spellID = 449631, talentID = 117418},
		Quietus = {spellID = 449634, talentID = 117443},
		SataielsVolition = {spellID = 449637, talentID = 117435},
		ShadowofDeath = {spellID = 449638, talentID = 117454},
	}
	ids.Demo_PvPTalent = {
		SingeMagic = 212623,
		CallFelhunter = 212619,
		PleasureThroughPain = 212618,
		CallFelLord = 212459,
		CallObserver = 201996,
		MasterSummoner = 212628,
		BaneofFragility = 199954,
		GatewayMastery = 248855,
		AmplifyCurse = 328774,
		NetherWard = 212295,
		EssenceDrain = 221711,
		CastingCircle = 221703,
	}
	ids.Demo_Form = {

	}
	ids.Demo_Buff = {
		BurningRush = 111400,
		DarkPact = 108416,
		DemonicCalling = 205146,
		DemonicCore = 264173,
	}
	ids.Demo_Debuff = {
		Corruption = 146739,
		Doom = 603,
	}
	ids.Demo_PetAbility = {
		CauterizeMaster = {spellID = 119899}, --Imp
		Suffering = {spellID = 17735}, --Voidwalker
		Whiplash = {spellID = 6360}, --Succubus
		ShadowBite = {spellID = 54049},
		SpellLock = {spellID = 19647}, --Felhunter
		DevourMagic = {spellID = 19505}, --Felhunter
		MeteorStrike = {spellID = 171017}, --Infernal	
		ThreateningPresence = {spellID = 112042}, -- Voidwalker
		Felstorm = {spellID = 89751}, -- Felguard
		AxeToss = {spellID = 89766}, -- Felguard
		SoulStrike = {spellID = 267964, talentID = 91538}, -- Felguard
	}

--Destruction
	ids.Dest_Ability = {
	--Warlock Baseline
		CommandDemon = {
			CauterizeMaster = {spellID = 119905}, --Imp
			Suffering = {spellID = 119907}, --Voidwalker
			Whiplash = {spellID = 119909}, --Succubus
			SpellLock = {spellID = 119910}, --Felhunter
			ShadowLock = {spellID = 171140}, --Doomguard
			MeteorStrike = {spellID = 171152}, --Infernal
		},
		CurseofWeakness = {spellID = 702},
		DrainLife = {spellID = 234153},
		EyeofKilrogg = {spellID = 126},
		Fear = {spellID = 5782},
		HealthFunnel = {spellID = 755},
		Healthstone = {
			Create = {spellID = 6201},
			CreateSoulwell = {spellID = 29893},
			Use = 5512,
		},
		Immolate = {spellID = 348},
		Incinerate = {spellID = 29722},
		RitualofDoom = {spellID = 342601},
		RitualofSummoning = {spellID = 698},
		Soulstone = {spellID = 20707},
		SubjugateDemon = {spellID = 1098},
		SummonDemon = {
			Imp = {spellID = 688},
			Voidwalker = {spellID = 697},
			Felhunter = {spellID = 691},
			Succubus = {spellID = 712},
			Felguard = {spellID = 30146},
		},
		UnendingBreath = {spellID = 5697},
		UnendingResolve = {spellID = 104773},
		--Passive
		SoulShards = {spellID = 246985},
	--Destruction Baseline
		ChaosBolt = {spellID = 116858},
		--Passive
		MasteryChaoticEnergies = {spellID = 77220},
	--Warlock
		FelDomination = {spellID = 333889, talentID = 91439},
		SoulLeech = {spellID = 108370, talentID = 91441},
		BurningRush = {spellID = 111400, talentID = 91460},
		FelPact = {spellID = 386113, talentID = 91440},
		DemonSkin = {spellID = 219272, talentID = 91463},
		FelArmor = {spellID = 386124, talentID = 91461},
		FiendishStride = {spellID = 386110, talentID = 91459},
		CursesofEnfeeblement = {spellID = 386105, talentID = 91462},
			CurseofExhaustion = {spellID = 334275, talentID = 91462},
			CurseofTongues = {spellID = 1714, talentID = 91462},
		DemonicCircle = {
			Summon = {spellID = 48018, talentID = 124694},
			Teleport = {spellID = 48020, talentID = 124694},
			},
		HowlofTerror = {spellID = 5484, talentID = 91458},
		MortalCoil = {spellID = 6789, talentID = 91457},
		AmplifyCurse = {spellID = 328774, talentID = 91442},
		DemonicEmbrace = {spellID = 288843, talentID = 91438},
		DemonicInspiration = {spellID = 386858, talentID = 91436},
		AbyssWalker = {spellID = 389609, talentID = 91465},
		WrathfulMinion = {spellID = 386864, talentID = 91456},
		DemonicFortitude = {spellID = 386617, talentID = 91430},
		Banish = {spellID = 710, talentID = 91454},
		TeachingsoftheSatyr = {spellID = 387972, talentID = 91443},
		AccruedVitality = {spellID = 386613, talentID = 91464},
		SweetSouls = {spellID = 386620, talentID = 91435},
		Nightmare = {spellID = 386648, talentID = 91422},
		Horrify = {spellID = 56244, talentID = 115459},
		DemonicGateway = {spellID = 111771, talentID = 91466},
		Lifeblood = {spellID = 386646, talentID = 91449},
		DarkPact = {spellID = 108416, talentID = 91444},
		StrengthofWill = {spellID = 317138, talentID = 91468},
		DarkAccord = {spellID = 386659, talentID = 91467},
		Shadowfury = {spellID = 30283, talentID = 91452},
		IchorofDevils = {spellID = 386664, talentID = 91446},
		FrequentDonor = {spellID = 386686, talentID = 91445},
		SocretharsGuile = {spellID = 405936, talentID = 115461},
		SargereiTechnique = {spellID = 405955, talentID = 115462},
		Darkfury = {spellID = 264874, talentID = 91451},
		Shadowflame = {spellID = 384069, talentID = 91450},
		SwiftArtifice = {spellID = 452902, talentID = 91425},
		DemonicTactics = {spellID = 452894, talentID = 91433},
		TeachingsoftheBlackHarvest = {spellID = 385881, talentID = 91447},
		ResoluteBarrier = {spellID = 389359, talentID = 91421},
		FelSynergy = {spellID = 389367, talentID = 91432},
		SoulLink = {spellID = 108415, talentID = 91431},
		DemonicResilience = {spellID = 389590, talentID = 91424},
		PactofGluttony = {spellID = 386689, talentID = 91434},
			DemonicHealthstone = {spellID = 224464, talentID = 91434},
		SoulConduit = {spellID = 215941, talentID = 91427},
		Soulburn = {spellID = 385899, talentID = 91469},
	--Destruction
		Conflagrate = {spellID = 17962, talentID = 91591},
		Backdraft = {spellID = 196406, talentID = 91590},
		RainofFire = {spellID = 5740, talentID = 91592},
		RoaringBlaze = {spellID = 205184, talentID = 91588},
		ImprovedConflagrate = {spellID = 231793, talentID = 91587},
		Backlash = {spellID = 387384, talentID = 91500},
		Mayhem = {spellID = 387506, talentID = 91494},
		Havoc = {spellID = 80240, talentID = 91493},
		Pyrogenics = {spellID = 387095, talentID = 91489},
		Inferno = {spellID = 270545, talentID = 91488},
		Cataclysm = {spellID = 152108, talentID = 91487},
		IndiscriminateFlames = {spellID = 457114, talentID = 126005},
		RollingHavoc = {spellID = 387569, talentID = 91474},
		ScaldingFlames = {spellID = 388832, talentID = 91486},
		Shadowburn = {spellID = 17877, talentID = 91582},
		ExplosivePotential = {spellID = 388827, talentID = 91581},
		SummonersEmbrace = {spellID = 453105, talentID = 91484},
		GrimoireofSacrifice = {spellID = 108503, talentID = 125618},
		AshenRemains = {spellID = 387252, talentID = 91482},
		ChannelDemonfire = {spellID = 196447, talentID = 91586},
		BlisteringAtrophy = {spellID = 456939, talentID = 126006},
		ConflagrationofChaos = {spellID = 387108, talentID = 91583},
		Emberstorm = {spellID = 454744, talentID = 91584},
		SummonInfernal = {spellID = 1122, talentID = 91502},
		FireandBrimstone = {spellID = 196408, talentID = 91499},
		Flashpoint = {spellID = 387259, talentID = 91485},
		RagingDemonfire = {spellID = 387166, talentID = 91585},
		FiendishCruelty = {spellID = 456943, talentID = 126004},
		Eradication = {spellID = 196412, talentID = 91501},
		CrashingChaos = {spellID = 417234, talentID = 91473},
		RainofChaos = {spellID = 266086, talentID = 126494},
		ReverseEntropy = {spellID = 205148, talentID = 91496},
		InternalCombustion = {spellID = 266134, talentID = 91495},
		DemonfireMastery = {spellID = 456946, talentID = 126003},
		Devastation = {spellID = 454735, talentID = 91589},
		RitualofRuin = {spellID = 387156, talentID = 91483},
		Ruin = {spellID = 387103, talentID = 91480},
		SoulFire = {spellID = 6353, talentID = 91492},
		ImprovedChaosBolt = {spellID = 456951, talentID = 126002},
		BurntoAshes = {spellID = 387153, talentID = 91477},
		MasterRitualist = {spellID = 387165, talentID = 91475},
		PowerOverwhelming = {spellID = 387279, talentID = 91478},
		DiabolicEmbers = {spellID = 387173, talentID = 91481},
		DimensionalRift = {spellID = 387976, talentID = 91423},
		Decimation = {spellID = 456985, talentID = 126007},
		ChaosIncarnate = {spellID = 387275, talentID = 91479},
		AvatarofDestruction = {spellID = 456975, talentID = 126008},
		DimensionRipper = {spellID = 457025, talentID = 126012},
		UnstableRifts = {spellID = 457064, talentID = 126493},
	--Hero
	--Diabolist
		DiabolicRitual = {spellID = 428514, talentID = 117452},
		ClovenSouls = {spellID = 428517, talentID = 117446},
		TouchofRancora = {spellID = 429893, talentID = 117453},
		SecretsoftheCoven = {spellID = 428518, talentID = 117423},
			InfernalBolt = {spellID = 434506, talentID = 117423},
		SoulEtchedCircles = {spellID = 428911, talentID = 117433},
		AnnihilansBellow = {spellID = 429072, talentID = 118837},
		CrueltyofKerxan = {spellID = 429902, talentID = 117445},
		InfernalMachine = {spellID = 429917, talentID = 118838},
		InfernalVitality = {spellID = 429115, talentID = 117449},
		InfernalBulwark = {spellID = 429130, talentID = 118839},
		FlamesofXoroth = {spellID = 429657, talentID = 117430},
		AbyssalDominion = {spellID = 429581, talentID = 117428},
		GloomofNathreza = {spellID = 429899, talentID = 117440},
		RuinationPassive = {spellID = 428522, talentID = 117427},
			Ruination = {spellID = 434635, talentID = 117427},
	--Hellcaller
		Wither = {spellID = 445468, talentID = 117437},
		XalansFerocity = {spellID = 440044, talentID = 117450},
		BlackenedSoul = {spellID = 440043, talentID = 117434},
		XalansCruelty = {spellID = 440040, talentID = 117442},
		CurseoftheSatyr = {spellID = 440057, talentID = 117419},
		AuraofEnfeeblement = {spellID = 440059, talentID = 123309},
		HatefuryRituals = {spellID = 440048, talentID = 117451},
		BleakheartTactics = {spellID = 440051, talentID = 123310},
		ZevrimsResilience = {spellID = 440065, talentID = 117432},
		IllhoofsDesign = {spellID = 440070, talentID = 123308},
		MarkofXavius = {spellID = 440046, talentID = 117431},
		SeedsofTheirDemise = {spellID = 440055, talentID = 117426},
		MarkofPerotharn = {spellID = 440045, talentID = 117441},
		Malevolence = {spellID = 442726, talentID = 117439},
	}
	ids.Dest_Form = {

	}
	ids.Dest_Buff = {
		BackDraft = 117828,
		BurningRush = 111400,
		DarkPact = 108416,
		GrimoireofSacrifice = 196099,
		RitualofRuin = 387157,
 	}
	ids.Dest_Debuff = {
		Conflagrate = 265931,
		Eradication = 196414,
		Havoc = 80240,
		Immolate = 157736,
		Wither = 445474,
	}
	ids.Dest_PetAbility = {
		CauterizeMaster = {spellID = 119899}, --Imp
		Suffering = {spellID = 17735}, --Voidwalker
		Whiplash = {spellID = 6360}, --Succubus
		ShadowBite = {spellID = 54049},
		SpellLock = {spellID = 19647}, --Felhunter
		DevourMagic = {spellID = 19505}, --Felhunter
		MeteorStrike = {spellID = 171017}, --Infernal	
		ThreateningPresence = {spellID = 112042}, -- Voidwalker
		Felstorm = {spellID = 89751}, -- Felguard
		AxeToss = {spellID = 89766},
	}