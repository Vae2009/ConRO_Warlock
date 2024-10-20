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
		AbyssWalker = {spellID = 389609, talentID = 91465},
		AccruedVitality = {spellID = 386613, talentID = 91464},
		AmplifyCurse = {spellID = 328774, talentID = 91442},
		Banish = {spellID = 710, talentID = 91454},
		BurningRush = {spellID = 111400, talentID = 91460},
		CursesofEnfeeblement = {spellID = 386105, talentID = 91462},
			CurseofExhaustion = {spellID = 334275, talentID = 91462},
			CurseofTongues = {spellID = 1714, talentID = 91462},
		DarkAccord = {spellID = 386659, talentID = 91467},
		DarkPact = {spellID = 108416, talentID = 91444},
		Darkfury = {spellID = 264874, talentID = 91451},
		DemonSkin = {spellID = 219272, talentID = 91463},
		DemonicCircle = {
			Summon = {spellID = 48018, talentID = 124694},
			Teleport = {spellID = 48020, talentID = 124694},
			},
		DemonicEmbrace = {spellID = 288843, talentID = 91438},
		DemonicFortitude = {spellID = 386617, talentID = 91430},
		DemonicGateway = {spellID = 111771, talentID = 91466},
		DemonicInspiration = {spellID = 386858, talentID = 91436},
		DemonicResilience = {spellID = 389590, talentID = 91424},
		DemonicTactics = {spellID = 452894, talentID = 91433},
		FelArmor = {spellID = 386124, talentID = 91461},
		FelDomination = {spellID = 333889, talentID = 91439},
		FelPact = {spellID = 386113, talentID = 91440},
		FelSynergy = {spellID = 389367, talentID = 91432},
		FiendishStride = {spellID = 386110, talentID = 91459},
		FrequentDonor = {spellID = 386686, talentID = 91445},
		Horrify = {spellID = 56244, talentID = 115459},
		HowlofTerror = {spellID = 5484, talentID = 91458},
		IchorofDevils = {spellID = 386664, talentID = 91446},
		Lifeblood = {spellID = 386646, talentID = 91449},
		MortalCoil = {spellID = 6789, talentID = 91457},
		Nightmare = {spellID = 386648, talentID = 91422},
		PactofGluttony = {spellID = 386689, talentID = 91434},
		ResoluteBarrier = {spellID = 389359, talentID = 91421},
		SargereiTechnique = {spellID = 405955, talentID = 115462},
		Shadowflame = {spellID = 384069, talentID = 91450},
		Shadowfury = {spellID = 30283, talentID = 91452},
		SocretharsGuile = {spellID = 405936, talentID = 115461},
		SoulConduit = {spellID = 215941, talentID = 91427},
		SoulLeech = {spellID = 108370, talentID = 91441},
		SoulLink = {spellID = 108415, talentID = 91431},
		Soulburn = {spellID = 385899, talentID = 91469},
		StrengthofWill = {spellID = 317138, talentID = 91468},
		SweetSouls = {spellID = 386620, talentID = 91435},
		SwiftArtifice = {spellID = 452902, talentID = 91425},
		TeachingsoftheBlackHarvest = {spellID = 385881, talentID = 91447},
		TeachingsoftheSatyr = {spellID = 387972, talentID = 91443},
		WrathfulMinion = {spellID = 386864, talentID = 91456},
	--Affliction
		AbsoluteCorruption = {spellID = 196103, talentID = 91572},
		Contagion = {spellID = 453096, talentID = 91562},
		CreepingDeath = {spellID = 264000, talentID = 91580},
		CulltheWeak = {spellID = 453056, talentID = 91559},
		CunningCruelty = {spellID = 453172, talentID = 91576},
		DarkHarvest = {spellID = 387016, talentID = 126062},
		DarkVirtuosity = {spellID = 405327, talentID = 91564},
		DeathsEmbrace = {spellID = 453189, talentID = 91553},
		DrainSoul = {spellID = 388667, talentID = 124692},
		FocusedMalignancy = {spellID = 399668, talentID = 91563},
		GrimoireofSacrifice = {spellID = 108503, talentID = 124691},
		Haunt = {spellID = 48181, talentID = 91552},
		ImprovedHaunt = {spellID = 458034, talentID = 126064},
		ImprovedMalefic = {spellID = 454378, talentID = 91555},
		ImprovedShadowBolt = {spellID = 453080, talentID = 91566},
		Infirmity = {spellID = 458036, talentID = 126065},
		KindledMalice = {spellID = 405330, talentID = 91561},
		Malediction = {spellID = 453087, talentID = 91567},
		MaleficTouch = {spellID = 458029, talentID = 126063},
		MalevolentVisionary = {spellID = 387273, talentID = 91504},
		MalignOmen = {spellID = 458041, talentID = 91579},
		Nightfall = {spellID = 108558, talentID = 91568},
		Oblivion = {spellID = 417537, talentID = 91503},
		PerpetualUnstability = {spellID = 459376, talentID = 126302},
		PhantomSingularity = {spellID = 205179, talentID = 126061},
		RavenousAfflictions = {spellID = 459440, talentID = 126303},
		Relinquished = {spellID = 453083, talentID = 91573},
		SacrolashsDarkStrike = {spellID = 386986, talentID = 91575},
		SeedofCorruption = {spellID = 27243, talentID = 91571},
		ShadowEmbrace = {spellID = 32388, talentID = 124690},
		SiphonLife = {spellID = 452999, talentID = 124693},
		SoulRot = {spellID = 386997, talentID = 91578},
		SummonDarkglare = {spellID = 205180, talentID = 91554},
		SummonersEmbrace = {spellID = 453105, talentID = 91558},
		TormentedCrescendo = {spellID = 387075, talentID = 91551},
		UnstableAffliction = {spellID = 316099, talentID = 91570},
		VileTaint = {spellID = 278350, talentID = 91556},
		VolatileAgony = {spellID = 453034, talentID = 91560},
		WitheringBolt = {spellID = 386976, talentID = 91577},
		WritheinAgony = {spellID = 196102, talentID = 91569},
		XaviusGambit = {spellID = 416615, talentID = 91429},
	--Hero
	--Hellcaller
		AuraofEnfeeblement = {spellID = 440059, talentID = 123309},
		BlackenedSoul = {spellID = 440043, talentID = 117434},
		BleakheartTactics = {spellID = 440051, talentID = 123310},
		CurseoftheSatyr = {spellID = 440057, talentID = 117419},
		HatefuryRituals = {spellID = 440048, talentID = 117451},
		IllhoofsDesign = {spellID = 440070, talentID = 123308},
		Malevolence = {spellID = 442726, talentID = 117439},
		MarkofPerotharn = {spellID = 440045, talentID = 117441},
		MarkofXavius = {spellID = 440046, talentID = 117431},
		SeedsofTheirDemise = {spellID = 440055, talentID = 117426},
		Wither = {spellID = 445468, talentID = 117437},
		XalansCruelty = {spellID = 440040, talentID = 117442},
		XalansFerocity = {spellID = 440044, talentID = 117450},
		ZevrimsResilience = {spellID = 440065, talentID = 117432},
	--Soul Harvester
		DemoniacsFervor = {spellID = 449629, talentID = 117429},
		DemonicSoul = {spellID = 449614, talentID = 117448},
		EternalServitude = {spellID = 449707, talentID = 117421},
		FeastofSouls = {spellID = 449706, talentID = 123839},
		FriendsInDarkPlaces = {spellID = 449703, talentID = 123840},
		GoreboundFortitude = {spellID = 449701, talentID = 117447},
		GorefiendsResolve = {spellID = 389623, talentID = 123838},
		NecrolyteTeachings = {spellID = 449620, talentID = 117422},
		Quietus = {spellID = 449634, talentID = 117443},
		SataielsVolition = {spellID = 449637, talentID = 117435},
		ShadowofDeath = {spellID = 449638, talentID = 117454},
		SharedFate = {spellID = 449704, talentID = 117420},
		SoulAnathema = {spellID = 449624, talentID = 117444},
		WickedReaping = {spellID = 449631, talentID = 117418},
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
		MaleficAffliction = 389845,
	}
	ids.Aff_Buff = {
		BurningRush = 111400,
		DarkPact = 108416,
		GrimoireofSacrifice = 196099,
	}
	ids.Aff_Debuff = {
		Agony = 980,
		Corruption = 146739,
		DrainSoul = 198590,
		Haunt = 48181,
		MaleficAffliction = 389845,
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
		AbyssWalker = {spellID = 389609, talentID = 91465},
		AccruedVitality = {spellID = 386613, talentID = 91464},
		AmplifyCurse = {spellID = 328774, talentID = 91442},
		Banish = {spellID = 710, talentID = 91454},
		BurningRush = {spellID = 111400, talentID = 91460},
		CursesofEnfeeblement = {spellID = 386105, talentID = 91462},
			CurseofExhaustion = {spellID = 334275, talentID = 91462},
			CurseofTongues = {spellID = 1714, talentID = 91462},
		DarkAccord = {spellID = 386659, talentID = 91467},
		DarkPact = {spellID = 108416, talentID = 91444},
		Darkfury = {spellID = 264874, talentID = 91451},
		DemonSkin = {spellID = 219272, talentID = 91463},
		DemonicCircle = {
			Summon = {spellID = 48018, talentID = 124694},
			Teleport = {spellID = 48020, talentID = 124694},
			},
		DemonicEmbrace = {spellID = 288843, talentID = 91438},
		DemonicFortitude = {spellID = 386617, talentID = 91430},
		DemonicGateway = {spellID = 111771, talentID = 91466},
		DemonicInspiration = {spellID = 386858, talentID = 91436},
		DemonicResilience = {spellID = 389590, talentID = 91424},
		DemonicTactics = {spellID = 452894, talentID = 91433},
		FelArmor = {spellID = 386124, talentID = 91461},
		FelDomination = {spellID = 333889, talentID = 91439},
		FelPact = {spellID = 386113, talentID = 91440},
		FelSynergy = {spellID = 389367, talentID = 91432},
		FiendishStride = {spellID = 386110, talentID = 91459},
		FrequentDonor = {spellID = 386686, talentID = 91445},
		Horrify = {spellID = 56244, talentID = 115459},
		HowlofTerror = {spellID = 5484, talentID = 91458},
		IchorofDevils = {spellID = 386664, talentID = 91446},
		Lifeblood = {spellID = 386646, talentID = 91449},
		MortalCoil = {spellID = 6789, talentID = 91457},
		Nightmare = {spellID = 386648, talentID = 91422},
		PactofGluttony = {spellID = 386689, talentID = 91434},
		ResoluteBarrier = {spellID = 389359, talentID = 91421},
		SargereiTechnique = {spellID = 405955, talentID = 115462},
		Shadowflame = {spellID = 384069, talentID = 91450},
		Shadowfury = {spellID = 30283, talentID = 91452},
		SocretharsGuile = {spellID = 405936, talentID = 115461},
		SoulConduit = {spellID = 215941, talentID = 91427},
		SoulLeech = {spellID = 108370, talentID = 91441},
		SoulLink = {spellID = 108415, talentID = 91431},
		Soulburn = {spellID = 385899, talentID = 91469},
		StrengthofWill = {spellID = 317138, talentID = 91468},
		SweetSouls = {spellID = 386620, talentID = 91435},
		SwiftArtifice = {spellID = 452902, talentID = 91425},
		TeachingsoftheBlackHarvest = {spellID = 385881, talentID = 91447},
		TeachingsoftheSatyr = {spellID = 387972, talentID = 91443},
		WrathfulMinion = {spellID = 386864, talentID = 91456},
	--Demonology
		AnnihilanTraining = {spellID = 386174, talentID = 125826},
		AntoranArmaments = {spellID = 387494, talentID = 125859},
		BilescourgeBombers = {spellID = 267211, talentID = 125833},
		BloodInvocation = {spellID = 455576, talentID = 125849},
		CallDreadstalkers = {spellID = 104316, talentID = 125837},
		CarnivorousStalkers = {spellID = 386194, talentID = 125829},
		Demoniac = {spellID = 426115, talentID = 125834},
			Demonbolt = {spellID = 264178, talentID = 125834},
			DemonicCore = {spellID = 267102, talentID = 125834},
		DemonicBrutality = {spellID = 453908, talentID = 125866},
		DemonicCalling = {spellID = 205145, talentID = 125848},
		DemonicStrength = {spellID = 267171, talentID = 125832},
		Doom = {spellID = 460551, talentID = 125865},
		DoomEternal = {spellID = 455585, talentID = 125851},
		DreadCalling = {spellID = 387391, talentID = 125831},
		Dreadlash = {spellID = 264078, talentID = 125830},
		FelInvocation = {spellID = 428351, talentID = 125842},
		FelSunder = {spellID = 387399, talentID = 125857},
		FiendishOblation = {spellID = 455569, talentID = 125858},
		Flametouched = {spellID = 453699, talentID = 125855},
		FoulMouth = {spellID = 455502, talentID = 125864},
		GrimoireFelguard = {spellID = 111898, talentID = 125852},
		Guillotine = {spellID = 386833, talentID = 125840},
		ImmutableHatred = {spellID = 405670, talentID = 125841},
		ImpGangBoss = {spellID = 387445, talentID = 125868},
		Imperator = {spellID = 416230, talentID = 125869},
		ImpendingDoom = {spellID = 455587, talentID = 125827},
		Implosion = {spellID = 196277, talentID = 125836},
		ImprovedDemonic = {spellID = 453800, talentID = 125835},
		InnerDemons = {spellID = 267216, talentID = 125871},
		MarkofFharg = {spellID = 455450, talentID = 125838},
			SummonCharhound = {spellID = _, talentID = 125838},
		MarkofShatug = {spellID = 455449, talentID = 125839},
			SummonGloodhound = {spellID = _, talentID = 125839},
		PactoftheEredruin = {spellID = 453568, talentID = 125863},
		PactoftheImpMother = {spellID = 387541, talentID = 125870},
		PowerSiphon = {spellID = 264130, talentID = 125862},
		ReignofTyranny = {spellID = 427684, talentID = 125854},
		RuneofShadows = {spellID = 453744, talentID = 125860},
		SacrificedSouls = {spellID = 267214, talentID = 125828},
		ShadowInvocation = {spellID = 422054, talentID = 125867},
		Shadowtouched = {spellID = 453619, talentID = 125856},
		SoulStrike = {spellID = 428344, talentID = 125844},
		SpitefulReconstitution = {spellID = 428394, talentID = 125846},
		SummonDemonicTyrant = {spellID = 265187, talentID = 125850},
		SummonVilefiend = {spellID = 264119, talentID = 125845},
		TheExpendables = {spellID = 387600, talentID = 125847},
		TheHoundmastersGambit = {spellID = 455572, talentID = 125843},
		UmbralBlaze = {spellID = 405798, talentID = 125861},
		WickedMaw = {spellID = 267170, talentID = 125872},
	--Hero
	--Diabolist
		AbyssalDominion = {spellID = 429581, talentID = 117428},
		AnnihilansBellow = {spellID = 429072, talentID = 118837},
		DiabolicRitual = {spellID = 428514, talentID = 117452},
		ClovenSouls = {spellID = 428517, talentID = 117446},
		CrueltyofKerxan = {spellID = 429902, talentID = 117445},
		FlamesofXoroth = {spellID = 429657, talentID = 117430},
		GloomofNathreza = {spellID = 429899, talentID = 117440},
		InfernalBulwark = {spellID = 429130, talentID = 118839},
		InfernalMachine = {spellID = 429917, talentID = 118838},
		InfernalVitality = {spellID = 429115, talentID = 117449},
		RuinationPassive = {spellID = 428522, talentID = 117427},
			Ruination = {spellID = _, talentID = 117427},
		SecretsoftheCoven = {spellID = 428518, talentID = 117423},
		SoulEtchedCircles = {spellID = 428911, talentID = 117433},
		TouchofRancora = {spellID = 429893, talentID = 117453},
	--Soul Harvester
		DemoniacsFervor = {spellID = 449629, talentID = 117429},
		DemonicSoul = {spellID = 449614, talentID = 117448},
		EternalServitude = {spellID = 449707, talentID = 117421},
		FeastofSouls = {spellID = 449706, talentID = 123839},
		FriendsInDarkPlaces = {spellID = 449703, talentID = 123840},
		GoreboundFortitude = {spellID = 449701, talentID = 117447},
		GorefiendsResolve = {spellID = 389623, talentID = 123838},
		NecrolyteTeachings = {spellID = 449620, talentID = 117422},
		Quietus = {spellID = 449634, talentID = 117443},
		SataielsVolition = {spellID = 449637, talentID = 117435},
		ShadowofDeath = {spellID = 449638, talentID = 117454},
		SharedFate = {spellID = 449704, talentID = 117420},
		SoulAnathema = {spellID = 449624, talentID = 117444},
		WickedReaping = {spellID = 449631, talentID = 117418},
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
		AbyssWalker = {spellID = 389609, talentID = 91465},
		AccruedVitality = {spellID = 386613, talentID = 91464},
		AmplifyCurse = {spellID = 328774, talentID = 91442},
		Banish = {spellID = 710, talentID = 91454},
		BurningRush = {spellID = 111400, talentID = 91460},
		CursesofEnfeeblement = {spellID = 386105, talentID = 91462},
			CurseofExhaustion = {spellID = 334275, talentID = 91462},
			CurseofTongues = {spellID = 1714, talentID = 91462},
		DarkAccord = {spellID = 386659, talentID = 91467},
		DarkPact = {spellID = 108416, talentID = 91444},
		Darkfury = {spellID = 264874, talentID = 91451},
		DemonSkin = {spellID = 219272, talentID = 91463},
		DemonicCircle = {
			Summon = {spellID = 48018, talentID = 124694},
			Teleport = {spellID = 48020, talentID = 124694},
			},
		DemonicEmbrace = {spellID = 288843, talentID = 91438},
		DemonicFortitude = {spellID = 386617, talentID = 91430},
		DemonicGateway = {spellID = 111771, talentID = 91466},
		DemonicInspiration = {spellID = 386858, talentID = 91436},
		DemonicResilience = {spellID = 389590, talentID = 91424},
		DemonicTactics = {spellID = 452894, talentID = 91433},
		FelArmor = {spellID = 386124, talentID = 91461},
		FelDomination = {spellID = 333889, talentID = 91439},
		FelPact = {spellID = 386113, talentID = 91440},
		FelSynergy = {spellID = 389367, talentID = 91432},
		FiendishStride = {spellID = 386110, talentID = 91459},
		FrequentDonor = {spellID = 386686, talentID = 91445},
		Horrify = {spellID = 56244, talentID = 115459},
		HowlofTerror = {spellID = 5484, talentID = 91458},
		IchorofDevils = {spellID = 386664, talentID = 91446},
		Lifeblood = {spellID = 386646, talentID = 91449},
		MortalCoil = {spellID = 6789, talentID = 91457},
		Nightmare = {spellID = 386648, talentID = 91422},
		PactofGluttony = {spellID = 386689, talentID = 91434},
		ResoluteBarrier = {spellID = 389359, talentID = 91421},
		SargereiTechnique = {spellID = 405955, talentID = 115462},
		Shadowflame = {spellID = 384069, talentID = 91450},
		Shadowfury = {spellID = 30283, talentID = 91452},
		SocretharsGuile = {spellID = 405936, talentID = 115461},
		SoulConduit = {spellID = 215941, talentID = 91427},
		SoulLeech = {spellID = 108370, talentID = 91441},
		SoulLink = {spellID = 108415, talentID = 91431},
		Soulburn = {spellID = 385899, talentID = 91469},
		StrengthofWill = {spellID = 317138, talentID = 91468},
		SweetSouls = {spellID = 386620, talentID = 91435},
		SwiftArtifice = {spellID = 452902, talentID = 91425},
		TeachingsoftheBlackHarvest = {spellID = 385881, talentID = 91447},
		TeachingsoftheSatyr = {spellID = 387972, talentID = 91443},
		WrathfulMinion = {spellID = 386864, talentID = 91456},
	--Destruction
		AshenRemains = {spellID = 387252, talentID = 91482},
		AvatarofDestruction = {spellID = 456975, talentID = 126008},
		Backdraft = {spellID = 196406, talentID = 91590},
		Backlash = {spellID = 387384, talentID = 91500},
		BlisteringAtrophy = {spellID = 456939, talentID = 126006},
		BurntoAshes = {spellID = 387153, talentID = 91477},
		Cataclysm = {spellID = 152108, talentID = 91487},
		ChannelDemonfire = {spellID = 196447, talentID = 91586},
		ChaosIncarnate = {spellID = 387275, talentID = 91479},
		Conflagrate = {spellID = 17962, talentID = 91591},
		ConflagrationofChaos = {spellID = 387108, talentID = 91583},
		CrashingChaos = {spellID = 417234, talentID = 91473},
		Decimation = {spellID = 456985, talentID = 126007},
		DemonfireMastery = {spellID = 456946, talentID = 126003},
		Devastation = {spellID = 454735, talentID = 91589},
		DiabolicEmbers = {spellID = 387173, talentID = 91481},
		DimensionRipper = {spellID = 457025, talentID = 126012},
		DimensionalRift = {spellID = 387976, talentID = 91423},
		Emberstorm = {spellID = 454744, talentID = 91584},
		Eradication = {spellID = 196412, talentID = 91501},
		ExplosivePotential = {spellID = 388827, talentID = 91581},
		FiendishCruelty = {spellID = 456943, talentID = 126004},
		FireandBrimstone = {spellID = 196408, talentID = 91499},
		Flashpoint = {spellID = 387259, talentID = 91485},
		GrimoireofSacrifice = {spellID = 108503, talentID = 125618},
		Havoc = {spellID = 80240, talentID = 91493},
		ImprovedChaosBolt = {spellID = 456951, talentID = 126002},
		ImprovedConflagrate = {spellID = 231793, talentID = 91587},
		IndiscriminateFlames = {spellID = 457114, talentID = 126005},
		InternalCombustion = {spellID = 266134, talentID = 91495},
		Inferno = {spellID = 270545, talentID = 91488},
		MasterRitualist = {spellID = 387165, talentID = 91475},
		Mayhem = {spellID = 387506, talentID = 91494},
		PowerOverwhelming = {spellID = 387279, talentID = 91478},
		Pyrogenics = {spellID = 387095, talentID = 91489},
		RagingDemonfire = {spellID = 387166, talentID = 91585},
		RainofChaos = {spellID = 266086, talentID = 126494},
		RainofFire = {spellID = 5740, talentID = 91592},
		ReverseEntropy = {spellID = 205148, talentID = 91496},
		RitualofRuin = {spellID = 387156, talentID = 91483},
		RoaringBlaze = {spellID = 205184, talentID = 91588},
		RollingHavoc = {spellID = 387569, talentID = 91474},
		Ruin = {spellID = 387103, talentID = 91480},
		ScaldingFlames = {spellID = 388832, talentID = 91486},
		Shadowburn = {spellID = 17877, talentID = 91582},
		SoulFire = {spellID = 6353, talentID = 91492},
		SummonInfernal = {spellID = 1122, talentID = 91502},
		SummonersEmbrace = {spellID = 453105, talentID = 91484},
		UnstableRifts = {spellID = 457064, talentID = 126493},
	--Hero
	--Diabolist
		AbyssalDominion = {spellID = 429581, talentID = 117428},
		AnnihilansBellow = {spellID = 429072, talentID = 118837},
		DiabolicRitual = {spellID = 428514, talentID = 117452},
		ClovenSouls = {spellID = 428517, talentID = 117446},
		CrueltyofKerxan = {spellID = 429902, talentID = 117445},
		FlamesofXoroth = {spellID = 429657, talentID = 117430},
		GloomofNathreza = {spellID = 429899, talentID = 117440},
		InfernalBulwark = {spellID = 429130, talentID = 118839},
		InfernalMachine = {spellID = 429917, talentID = 118838},
		InfernalVitality = {spellID = 429115, talentID = 117449},
		RuinationPassive = {spellID = 428522, talentID = 117427},
			Ruination = {spellID = _, talentID = 117427},
		SecretsoftheCoven = {spellID = 428518, talentID = 117423},
		SoulEtchedCircles = {spellID = 428911, talentID = 117433},
		TouchofRancora = {spellID = 429893, talentID = 117453},
	--Hellcaller
		AuraofEnfeeblement = {spellID = 440059, talentID = 123309},
		BlackenedSoul = {spellID = 440043, talentID = 117434},
		BleakheartTactics = {spellID = 440051, talentID = 123310},
		CurseoftheSatyr = {spellID = 440057, talentID = 117419},
		HatefuryRituals = {spellID = 440048, talentID = 117451},
		IllhoofsDesign = {spellID = 440070, talentID = 123308},
		Malevolence = {spellID = 442726, talentID = 117439},
		MarkofPerotharn = {spellID = 440045, talentID = 117441},
		MarkofXavius = {spellID = 440046, talentID = 117431},
		SeedsofTheirDemise = {spellID = 440055, talentID = 117426},
		Wither = {spellID = 445468, talentID = 117437},
		XalansCruelty = {spellID = 440040, talentID = 117442},
		XalansFerocity = {spellID = 440044, talentID = 117450},
		ZevrimsResilience = {spellID = 440065, talentID = 117432},
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