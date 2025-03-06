ConRO.Warlock = {};
ConRO.Warlock.CheckTalents = function()
end
ConRO.Warlock.CheckPvP_Talents = function()
end
local ConRO_Warlock, ids = ...;
local Ability, Buff, Debuff, PvP_Talent, Pet_Ability = _, _, _, _, _;

function ConRO:EnableRotationModule(mode)
	mode = mode or 0;
	self.ModuleOnEnable = ConRO.Warlock.CheckTalents;
	self.ModuleOnEnable = ConRO.Warlock.CheckPvP_Talents;
	if mode == 0 then
		self.Description = "Warlock [No Specialization Under 10]";
		self.NextSpell = ConRO.Warlock.Disabled;
		self.NextDef = ConRO.Warlock.Disabled;
		self.ToggleHealer();
	end;
	if mode == 1 then
		self.Description = 'Warlock [Affliction - Caster]';
		if ConRO.db.profile._Spec_1_Enabled then
			Ability, Buff, Debuff, PvP_Talent, Pet_Ability = ids.affliction.ability, ids.affliction.buff, ids.affliction.debuff, ids.affliction.pvp_talent, ids.affliction.pet_ability;
			self.NextSpell = ConRO.Warlock.Affliction;
			self.NextDef = ConRO.Warlock.AfflictionDef;
			self.ToggleDamage();
			ConROWindow:SetAlpha(ConRO.db.profile.transparencyWindow);
			ConRODefenseWindow:SetAlpha(ConRO.db.profile.transparencyWindow);
		else
			self.NextSpell = ConRO.Warlock.Disabled;
			self.NextDef = ConRO.Warlock.Disabled;
			self.ToggleHealer();
			ConROWindow:SetAlpha(0);
			ConRODefenseWindow:SetAlpha(0);
		end
	end;
	if mode == 2 then
		self.Description = 'Warlock [Demonology - Caster]';
		if ConRO.db.profile._Spec_2_Enabled then
			Ability, Buff, Debuff, PvP_Talent, Pet_Ability = ids.demonology.ability, ids.demonology.buff, ids.demonology.debuff, ids.demonology.pvp_talent, ids.demonology.pet_ability;
			self.NextSpell = ConRO.Warlock.Demonology;
			self.NextDef = ConRO.Warlock.DemonologyDef;
			self.ToggleDamage();
			ConROWindow:SetAlpha(ConRO.db.profile.transparencyWindow);
			ConRODefenseWindow:SetAlpha(ConRO.db.profile.transparencyWindow);
		else
			self.NextSpell = ConRO.Warlock.Disabled;
			self.NextDef = ConRO.Warlock.Disabled;
			self.ToggleHealer();
			ConROWindow:SetAlpha(0);
			ConRODefenseWindow:SetAlpha(0);
		end
	end;
	if mode == 3 then
		self.Description = 'Warlock [Destruction - Caster]';
		if ConRO.db.profile._Spec_3_Enabled then
			Ability, Buff, Debuff, PvP_Talent, Pet_Ability = ids.destruction.ability, ids.destruction.buff, ids.destruction.debuff, ids.destruction.pvp_talent, ids.destruction.pet_ability;
			self.NextSpell = ConRO.Warlock.Destruction;
			self.NextDef = ConRO.Warlock.DestructionDef;
			self.ToggleDamage();
			ConROWindow:SetAlpha(ConRO.db.profile.transparencyWindow);
			ConRODefenseWindow:SetAlpha(ConRO.db.profile.transparencyWindow);
		else
			self.NextSpell = ConRO.Warlock.Disabled;
			self.NextDef = ConRO.Warlock.Disabled;
			self.ToggleHealer();
			ConROWindow:SetAlpha(0);
			ConRODefenseWindow:SetAlpha(0);
		end
	end;
	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED');
	self.lastSpellId = 0;
end

function ConRO:EnableDefenseModule(mode)

end

function ConRO:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
end

function ConRO.Warlock.Disabled(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
	return nil;
end

--Info
local _Player_Level = UnitLevel("player");
local _Player_Intellect = UnitStat("player", 4);
local _Player_Percent_Health = ConRO:PercentHealth('player');
local _is_PvP = ConRO:IsPvP();
local _in_combat = UnitAffectingCombat('player');
local _party_size = GetNumGroupMembers();
local _is_PC = UnitPlayerControlled("target");
local _is_Enemy = ConRO:TarHostile();
local _Target_Health = UnitHealth('target');
local _Target_Percent_Health = ConRO:PercentHealth('target');
local _can_execute = _Target_Percent_Health <= 20;

--Resources
local _Mana, _Mana_Max, _Mana_Percent = ConRO:PlayerPower('Mana');
local _SoulShards = ConRO:PlayerPower('SoulShards');

--Conditions
local _Queue = 0;
local _is_moving = ConRO:PlayerSpeed();
local _enemies_in_melee, _target_in_melee = ConRO:Targets("Melee");
local _enemies_in_10yrds, _target_in_10yrds = ConRO:Targets("10");
local _enemies_in_25yrds, _target_in_25yrds = ConRO:Targets("25");
local _enemies_in_40yrds, _target_in_40yrds = ConRO:Targets("40");

local _Pet_summoned = ConRO:CallPet();
local _Pet_assist = ConRO:PetAssist();
local _Pet_Percent_Health = ConRO:PercentHealth('pet');

--Racials
local _ArcanePulse, _ArcanePulse_RDY = _, _;
local _ArcaneTorrent, _ArcaneTorrent_RDY = _, _;
local _Berserking, _Berserking_RDY = _, _;
local _Cannibalize, _Cannibalize_RDY = _, _;

local HeroSpec, Racial = ids.hero_spec, ids.racial;

function ConRO:Stats()
	_Player_Level = UnitLevel("player");
	_Player_Intellect = UnitStat("player", 4);
	_Player_Percent_Health = ConRO:PercentHealth('player');
	_is_PvP = ConRO:IsPvP();
	_in_combat = UnitAffectingCombat('player');
	_party_size = GetNumGroupMembers();
	_is_PC = UnitPlayerControlled("target");
	_is_Enemy = ConRO:TarHostile();
	_Target_Health = UnitHealth('target');
	_Target_Percent_Health = ConRO:PercentHealth('target');
	_can_execute = _Target_Percent_Health <= 20;

	_Mana, _Mana_Max, _Mana_Percent = ConRO:PlayerPower('Mana');
	_SoulShards = ConRO:PlayerPower('SoulShards');

	_Queue = 0;
	_is_moving = ConRO:PlayerSpeed();
	_enemies_in_melee, _target_in_melee = ConRO:Targets("Melee");
	_enemies_in_10yrds, _target_in_10yrds = ConRO:Targets("10");
	_enemies_in_25yrds, _target_in_25yrds = ConRO:Targets("25");
	_enemies_in_40yrds, _target_in_40yrds = ConRO:Targets("40");

	_Pet_summoned = ConRO:CallPet();
	_Pet_assist = ConRO:PetAssist();
	_Pet_Percent_Health = ConRO:PercentHealth('pet');

	_ArcanePulse, _ArcanePulse_RDY = ConRO:AbilityReady(Racial.ArcanePulse, timeShift);
	_ArcaneTorrent, _ArcaneTorrent_RDY = ConRO:AbilityReady(Racial.ArcaneTorrent, timeShift);
	_Berserking, _Berserking_RDY = ConRO:AbilityReady(Racial.Berserking, timeShift);
	_Cannibalize, _Cannibalize_RDY = ConRO:AbilityReady(Racial.Cannibalize, timeShift);
end

function ConRO.Warlock.Affliction(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
	wipe(ConRO.SuggestedSpells)
	ConRO:Stats();

--Abilities
	local _Agony, _Agony_RDY = ConRO:AbilityReady(Ability.Agony, timeShift);
		local _Agony_DEBUFF = ConRO:TargetAura(Debuff.Agony, timeShift + 3);
	local _Corruption, _Corruption_RDY = ConRO:AbilityReady(Ability.Corruption, timeShift);
		local _Corruption_DEBUFF = ConRO:TargetAura(Debuff.Corruption, timeShift + 3);
	local _DrainSoul, _DrainSoul_RDY = ConRO:AbilityReady(Ability.DrainSoul, timeShift);
		local _DrainSoul_DEBUFF = ConRO:TargetAura(Debuff.DrainSoul, timeShift);
	local _GrimoireofSacrifice, _GrimoireofSacrifice_RDY = ConRO:AbilityReady(Ability.GrimoireofSacrifice, timeShift);
		local _GrimoireofSacrifice_BUFF = ConRO:Aura(Buff.GrimoireofSacrifice, timeShift);
	local _Haunt, _Haunt_RDY = ConRO:AbilityReady(Ability.Haunt, timeShift);
		local _Haunt_BUFF = ConRO:TargetAura(Debuff.Haunt, timeShift + 3);
	local _MaleficRapture, _MaleficRapture_RDY = ConRO:AbilityReady(Ability.MaleficRapture, timeShift);
		local _TormentedCrescendo_BUFF, _TormentedCrescendo_COUNT = ConRO:Aura(Buff.TormentedCrescendo, timeShift);
	local _Malevolence, _Malevolence_RDY = ConRO:AbilityReady(Ability.Malevolence, timeShift);
	local _PhantomSingularity, _PhantomSingularity_RDY = ConRO:AbilityReady(Ability.PhantomSingularity, timeShift);
		local _PhantomSingularity_DEBUFF = ConRO:TargetAura(Debuff.PhantomSingularity, timeShift);
	local _SeedofCorruption, _SeedofCorruption_RDY = ConRO:AbilityReady(Ability.SeedofCorruption, timeShift);
		local _SeedofCorruption_DEBUFF = ConRO:TargetAura(Debuff.SeedofCorruption, timeShift);
	local _ShadowBolt, _ShadowBolt_RDY = ConRO:AbilityReady(Ability.ShadowBolt, timeShift);
		local _Nightfall_BUFF, _Nightfall_COUNT = ConRO:Aura(Buff.Nightfall, timeShift);
		local _ShadowEmbrace_DEBUFF, _ShadowEmbrace_COUNT, _ShadowEmbrace_DUR = ConRO:TargetAura(Debuff.ShadowEmbrace, timeShift);
	local _SoulRot, _SoulRot_RDY, _SoulRot_CD = ConRO:AbilityReady(Ability.SoulRot, timeShift);
	local _SummonDarkglare, _SummonDarkglare_RDY = ConRO:AbilityReady(Ability.SummonDarkglare, timeShift);
	local _SummonFelhunter, _SummonFelhunter_RDY = ConRO:AbilityReady(Ability.SummonDemon.Felhunter, timeShift);
	local _UnstableAffliction, _UnstableAffliction_RDY = ConRO:AbilityReady(Ability.UnstableAffliction, timeShift);
	local _UnstableAfflictionRA, _UnstableAfflictionRA_RDY = ConRO:AbilityReady(PvP_Talent.UnstableAfflictionRA, timeShift, 'pvp');
		local _UnstableAffliction_DEBUFF = ConRO:TargetAura(Debuff.UnstableAffliction, timeShift + 3);
		local _UnstableAfflictionRA_DEBUFF = ConRO:TargetAura(Debuff.UnstableAfflictionRA, timeShift + 3);
	local _VileTaint, _VileTaint_RDY = ConRO:AbilityReady(Ability.VileTaint, timeShift);
		local _VileTaint_DEBUFF, _, _VileTaint_DUR = ConRO:TargetAura(Debuff.VileTaint, timeShift);

	local _SpellLockCD = ConRO:AbilityReady(Ability.CommandDemon.SpellLock, timeShift);
	local _SpellLock, _SpellLock_RDY = ConRO:AbilityReady(Pet_Ability.SpellLock, timeShift, 'pet');
	local _DevourMagic, _DevourMagic_RDY = ConRO:AbilityReady(Pet_Ability.DevourMagic, timeShift, 'pet');

	local _Void_out	= IsSpellKnown(Pet_Ability.ThreateningPresence.spellID, true);

--Conditions
	if currentSpell == _MaleficRapture then
		_SoulShards = _SoulShards - 1;
	elseif currentSpell == _SeedofCorruption then
		_SoulShards = _SoulShards - 1;
	elseif currentSpell == _VileTaint then
		_SoulShards = _SoulShards - 1;
	end

	if tChosen[Ability.DrainSoul.talentID] then
		_ShadowEmbrace_DEBUFF, _ShadowEmbrace_COUNT, _ShadowEmbrace_DUR = ConRO:TargetAura(Debuff.ShadowEmbraceDS, timeShift);
	end

	if currentSpell == _ShadowBolt or (tChosen[Ability.ImprovedHaunt.talentID] and currentSpell == _Haunt) then
		_ShadowEmbrace_COUNT = _ShadowEmbrace_COUNT + 1;
		_ShadowEmbrace_DEBUFF = true;
	end

	if ConRO:HeroSpec(HeroSpec.Hellcaller) then
		_Corruption, _Corruption_RDY = ConRO:AbilityReady(Ability.Wither, timeShift);
		_Corruption_DEBUFF, _, _Corruption_DUR = ConRO:TargetAura(Debuff.Wither, timeShift + 3);
	end

	if tChosen[Ability.AbsoluteCorruption.talentID] then
		if ConRO:HeroSpec(HeroSpec.Hellcaller) then
			_Corruption_DEBUFF = ConRO:PersistentDebuff(Debuff.Wither);
		else
			_Corruption_DEBUFF = ConRO:PersistentDebuff(Debuff.Corruption);
		end

		if not _is_PC then
			_Corruption_DUR = 10000;
		end
	end

	if _is_PvP then
		if pvpChosen[PvP_Talent.RampantAfflictions.spellID] then
			_UnstableAffliction, _UnstableAffliction_RDY, _UnstableAffliction_DEBUFF = _UnstableAfflictionRA, _UnstableAfflictionRA_RDY, _UnstableAfflictionRA_DEBUFF;
		end
	end

--Indicators
	ConRO:AbilityInterrupt(_SpellLock, _SpellLock_RDY and ConRO:Interrupt());
	ConRO:AbilityInterrupt(_SpellLockCD, _SpellLock_RDY and ConRO:Interrupt());
	ConRO:AbilityPurge(_DevourMagic, _DevourMagic_RDY and ConRO:Purgable());
	ConRO:AbilityPurge(_ArcaneTorrent, _ArcaneTorrent_RDY and _target_in_melee and ConRO:Purgable());

	ConRO:AbilityBurst(_Malevolence, _Malevolence_RDY and ConRO:HeroSpec(HeroSpec.Hellcaller) and _Corruption_DEBUFF and ConRO:BurstMode(_Malevolence));
	ConRO:AbilityBurst(_PhantomSingularity, _PhantomSingularity_RDY and _Agony_DEBUFF and _Corruption_DEBUFF and _UnstableAffliction_DEBUFF and ConRO:BurstMode(_PhantomSingularity));
	ConRO:AbilityBurst(_SoulRot, _SoulRot_RDY and currentSpell ~= _SoulRot and _Agony_DEBUFF and _Corruption_DEBUFF and _UnstableAffliction_DEBUFF and ConRO:BurstMode(_SoulRot));
	ConRO:AbilityBurst(_SummonDarkglare, _SummonDarkglare_RDY and _Agony_DEBUFF and _Corruption_DEBUFF and _UnstableAffliction_DEBUFF and (not tChosen[Ability.PhantomSingularity.talentID] or (tChosen[Ability.PhantomSingularity.talentID] and _PhantomSingularity_DEBUFF)) and (not tChosen[Ability.VileTaint.talentID] or (tChosen[Ability.VileTaint.talentID] and _VileTaint_DEBUFF)) and ConRO:BurstMode(_SummonDarkglare));
	ConRO:AbilityBurst(_GrimoireofSacrifice, _GrimoireofSacrifice_RDY and not _GrimoireofSacrifice_BUFF);

--Warnings
	ConRO:Warnings("Summon your demon!", not tChosen[Ability.GrimoireofSacrifice.talentID] and not _Pet_summoned);

--Rotations
	repeat
		while(true) do
			if not _in_combat then
				if _Haunt_RDY and not _Haunt_BUFF and currentSpell ~= _Haunt then
					tinsert(ConRO.SuggestedSpells, _Haunt);
					_Haunt_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if _SeedofCorruption_RDY and _SoulShards >= 1 and not _Corruption_DEBUFF and not _SeedofCorruption_DEBUFF and ((ConRO_AutoButton:IsVisible() and _enemies_in_melee >= 3) or ConRO_AoEButton:IsVisible()) then
					tinsert(ConRO.SuggestedSpells, _SeedofCorruption);
					_SoulShards = _SoulShards - 1;
					_SeedofCorruption_DEBUFF = true;
					_Corruption_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if _VileTaint_RDY and _SoulShards >= 1 and currentSpell ~= _VileTaint and ((ConRO_AutoButton:IsVisible() and _enemies_in_melee >= 3) or ConRO_AoEButton:IsVisible()) then
					tinsert(ConRO.SuggestedSpells, _VileTaint);
					_VileTaint_RDY = false;
					_Agony_DEBUFF = true;
					_SoulShards = _SoulShards - 1;
					_Queue = _Queue + 1;
					break;
				end

				if _UnstableAffliction_RDY and not _UnstableAffliction_DEBUFF and currentSpell ~= _UnstableAffliction then
					tinsert(ConRO.SuggestedSpells, _UnstableAffliction);
					_UnstableAffliction_RDY = false;
					_UnstableAffliction_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if _Agony_RDY and not _Agony_DEBUFF and currentSpell ~= _VileTaint then
					tinsert(ConRO.SuggestedSpells, _Agony);
					_Agony_RDY = false;
					_Agony_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end
			end

			if ((ConRO_AutoButton:IsVisible() and _enemies_in_melee >= 3) or ConRO_AoEButton:IsVisible()) then
				if _SeedofCorruption_RDY and _SoulShards >= 1 and not _Corruption_DEBUFF and not _SeedofCorruption_DEBUFF then
					tinsert(ConRO.SuggestedSpells, _SeedofCorruption);
					_SoulShards = _SoulShards - 1;
					_SeedofCorruption_DEBUFF = true;
					_Corruption_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if _UnstableAffliction_RDY and not _UnstableAffliction_DEBUFF and currentSpell ~= _UnstableAffliction then
					tinsert(ConRO.SuggestedSpells, _UnstableAffliction);
					_UnstableAffliction_RDY = false;
					_UnstableAffliction_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if _Haunt_RDY and not _Haunt_BUFF and currentSpell ~= _Haunt then
					tinsert(ConRO.SuggestedSpells, _Haunt);
					_Haunt_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if _VileTaint_RDY and _SoulShards >= 1 and currentSpell ~= _VileTaint then
					tinsert(ConRO.SuggestedSpells, _VileTaint);
					_VileTaint_RDY = false;
					_Agony_DEBUFF = true;
					_SoulShards = _SoulShards - 1;
					_Queue = _Queue + 1;
					break;
				end

				if _PhantomSingularity_RDY and ConRO:FullMode(_PhantomSingularity) then
					tinsert(ConRO.SuggestedSpells, _PhantomSingularity);
					_PhantomSingularity_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if _SoulRot_RDY and currentSpell ~= _SoulRot and ConRO:FullMode(_SoulRot) then
					tinsert(ConRO.SuggestedSpells, _SoulRot);
					_SoulRot_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if _SummonDarkglare_RDY and _Agony_DEBUFF and _Corruption_DEBUFF and _UnstableAffliction_DEBUFF and ConRO:FullMode(_SummonDarkglare) then
					tinsert(ConRO.SuggestedSpells, _SummonDarkglare);
					_SummonDarkglare_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if _Malevolence_RDY and ConRO:HeroSpec(HeroSpec.Hellcaller) and _Corruption_DEBUFF and ConRO:FullMode(_Malevolence) then
					tinsert(ConRO.SuggestedSpells, _Malevolence);
					_Malevolence_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if _MaleficRapture_RDY and (_SoulShards >= 1 or _TormentedCrescendo_COUNT >= 1) then
					tinsert(ConRO.SuggestedSpells, _MaleficRapture);
					if _TormentedCrescendo_BUFF then
						_TormentedCrescendo_COUNT = _TormentedCrescendo_COUNT - 1;
					else
						_SoulShards = _SoulShards - 1;
					end
					_Queue = _Queue + 1;
					break;
				end

				if tChosen[Ability.DrainSoul.talentID] then
					if _DrainSoul_RDY then
						tinsert(ConRO.SuggestedSpells, _DrainSoul);
						_Nightfall_COUNT = _Nightfall_COUNT - 1;
						_Queue = _Queue + 1;
						break;
					end
				else
					if _ShadowBolt_RDY then
						tinsert(ConRO.SuggestedSpells, _ShadowBolt);
						_Nightfall_COUNT = _Nightfall_COUNT - 1;
						_Queue = _Queue + 1;
						break;
					end
				end
			else
				if _Agony_RDY and not _Agony_DEBUFF and currentSpell ~= _VileTaint then
					tinsert(ConRO.SuggestedSpells, _Agony);
					_Agony_RDY = false;
					_Agony_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if _Corruption_RDY and not _Corruption_DEBUFF and not _SeedofCorruption_DEBUFF then
					tinsert(ConRO.SuggestedSpells, _Corruption);
					_Corruption_RDY = false;
					_Corruption_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if _UnstableAffliction_RDY and not _UnstableAffliction_DEBUFF and currentSpell ~= _UnstableAffliction then
					tinsert(ConRO.SuggestedSpells, _UnstableAffliction);
					_UnstableAffliction_RDY = false;
					_UnstableAffliction_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if _Haunt_RDY and not _Haunt_BUFF and currentSpell ~= _Haunt then
					tinsert(ConRO.SuggestedSpells, _Haunt);
					_Haunt_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if _MaleficRapture_RDY and (_TormentedCrescendo_COUNT >= 2 or _SoulShards >= 5) then
					tinsert(ConRO.SuggestedSpells, _MaleficRapture);
					_TormentedCrescendo_COUNT = _TormentedCrescendo_COUNT - 1;
					_Queue = _Queue + 1;
					break;
				end

				if tChosen[Ability.ShadowEmbrace.talentID] or _Nightfall_BUFF then
					if tChosen[Ability.DrainSoul.talentID] then
						if _DrainSoul_RDY and (_ShadowEmbrace_COUNT < 4 or _ShadowEmbrace_DUR <= 3 or _Nightfall_COUNT >= 2) then
							tinsert(ConRO.SuggestedSpells, _DrainSoul);
							_ShadowEmbrace_COUNT = _ShadowEmbrace_COUNT + 1;
							_ShadowEmbrace_DUR = 16;
							_Nightfall_COUNT = _Nightfall_COUNT - 1;
							_Queue = _Queue + 1;
							break;
						end
					else
						if _ShadowBolt_RDY and (_ShadowEmbrace_COUNT < 2 or _ShadowEmbrace_DUR <= 3 or _Nightfall_COUNT >= 2) then
							tinsert(ConRO.SuggestedSpells, _ShadowBolt);
							_ShadowEmbrace_COUNT = _ShadowEmbrace_COUNT + 1;
							_ShadowEmbrace_DUR = 16;
							_Nightfall_COUNT = _Nightfall_COUNT - 1;
							_Queue = _Queue + 1;
							break;
						end
					end
				end

				if _PhantomSingularity_RDY and (not tChosen[Ability.SoulRot.talentID] or (tChosen[Ability.SoulRot.talentID] and _SoulRot_RDY))  and ConRO:FullMode(_PhantomSingularity) then
					tinsert(ConRO.SuggestedSpells, _PhantomSingularity);
					_PhantomSingularity_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if _VileTaint_RDY and _SoulShards >= 1 and currentSpell ~= _VileTaint then
					tinsert(ConRO.SuggestedSpells, _VileTaint);
					_VileTaint_RDY = false;
					_Agony_DEBUFF = true;
					_SoulShards = _SoulShards - 1;
					_Queue = _Queue + 1;
					break;
				end

				if _SoulRot_RDY and currentSpell ~= _SoulRot and ConRO:FullMode(_SoulRot) then
					tinsert(ConRO.SuggestedSpells, _SoulRot);
					_SoulRot_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if _SummonDarkglare_RDY and _Agony_DEBUFF and _Corruption_DEBUFF and _UnstableAffliction_DEBUFF and ConRO:FullMode(_SummonDarkglare) then
					tinsert(ConRO.SuggestedSpells, _SummonDarkglare);
					_SummonDarkglare_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if _Malevolence_RDY and ConRO:HeroSpec(HeroSpec.Hellcaller) and _Corruption_DEBUFF and ConRO:FullMode(_Malevolence) then
					tinsert(ConRO.SuggestedSpells, _Malevolence);
					_Malevolence_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if _MaleficRapture_RDY and (_SoulShards >= 1 or _TormentedCrescendo_COUNT >= 1) then
					tinsert(ConRO.SuggestedSpells, _MaleficRapture);
					if _TormentedCrescendo_BUFF then
						_TormentedCrescendo_COUNT = _TormentedCrescendo_COUNT - 1;
					else
						_SoulShards = _SoulShards - 1;
					end
					_Queue = _Queue + 1;
					break;
				end

				if tChosen[Ability.DrainSoul.talentID] then
					if _DrainSoul_RDY then
						tinsert(ConRO.SuggestedSpells, _DrainSoul);
						_Nightfall_COUNT = _Nightfall_COUNT - 1;
						_Queue = _Queue + 1;
						break;
					end
				else
					if _ShadowBolt_RDY then
						tinsert(ConRO.SuggestedSpells, _ShadowBolt);
						_Nightfall_COUNT = _Nightfall_COUNT - 1;
						_Queue = _Queue + 1;
						break;
					end
				end
			end

			tinsert(ConRO.SuggestedSpells, 289603); --Waiting Spell Icon
			_Queue = _Queue + 3;
			break;
		end
	until _Queue >= 3;
	return nil;
end

function ConRO.Warlock.AfflictionDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
	wipe(ConRO.SuggestedDefSpells);
	ConRO:Stats();

--Abilities
	local _CreateHealthstone, _CreateHealthstone_RDY = ConRO:AbilityReady(Ability.Healthstone.Create, timeShift);
		local _Healthstone, _Healthstone_RDY, _, _, _Healthstone_COUNT = ConRO:ItemReady(Ability.Healthstone.Use, timeShift);
	local _DrainLife, _DrainLife_RDY = ConRO:AbilityReady(Ability.DrainLife, timeShift);
	local _HealthFunnel, _HealthFunnel_RDY = ConRO:AbilityReady(Ability.HealthFunnel, timeShift);
	local _UnendingResolve, _UnendingResolve_RDY = ConRO:AbilityReady(Ability.UnendingResolve, timeShift);

	local _DarkPact, _DarkPact_RDY = ConRO:AbilityReady(Ability.DarkPact, timeShift);
	local _MortalCoil, _MortalCoil_RDY = ConRO:AbilityReady(Ability.MortalCoil, timeShift);

	local _Void_out = IsSpellKnown(Pet_Ability.ThreateningPresence.spellID, true);

--Conditions
	if tChosen[Ability.PactofGluttony.talentID] then
		_Healthstone, _Healthstone_RDY, _, _, _Healthstone_COUNT = ConRO:ItemReady(Ability.DemonicHealthstone.spellID, timeShift);
	end

--Rotations
	if _CreateHealthstone_RDY and not _in_combat and _Healthstone_COUNT <= 0 then
		tinsert(ConRO.SuggestedDefSpells, _CreateHealthstone);
	end

	if _DrainLife_RDY and _Player_Percent_Health <= 60 then
		tinsert(ConRO.SuggestedDefSpells, _DrainLife);
	end

	if _MortalCoil_RDY and _Player_Percent_Health <= 80 then
		tinsert(ConRO.SuggestedDefSpells, _MortalCoil);
	end

	if _HealthFunnel_RDY and _Pet_summoned and _Pet_Percent_Health <= 50 then
		tinsert(ConRO.SuggestedDefSpells, _HealthFunnel);
	end

	if _Healthstone_RDY and _Player_Percent_Health <= 50 then
		tinsert(ConRO.SuggestedDefSpells, _Healthstone);
	end

	if _DarkPact_RDY then
		tinsert(ConRO.SuggestedDefSpells, _DarkPact);
	end

	if _UnendingResolve_RDY then
		tinsert(ConRO.SuggestedDefSpells, _UnendingResolve);
	end
	return nil;
end

function ConRO.Warlock.Demonology(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
	wipe(ConRO.SuggestedSpells);
	ConRO:Stats();

--Abilities
	local _BilescourgeBombers, _BilescourgeBombers_RDY = ConRO:AbilityReady(Ability.BilescourgeBombers, timeShift);
	local _CallDreadstalkers, _CallDreadstalkers_RDY, _CallDreadstalkers_CD = ConRO:AbilityReady(Ability.CallDreadstalkers, timeShift);
	local _Demonbolt, _Demonbolt_RDY = ConRO:AbilityReady(Ability.Demonbolt, timeShift);
		local _, _DemonicCore_COUNT, _DemonicCore_DUR = ConRO:Aura(Buff.DemonicCore, timeShift);
	local _DemonicStrength, _DemonicStrength_RDY = ConRO:AbilityReady(Ability.DemonicStrength, timeShift);
	local _GrimoireFelguard, _GrimoireFelguard_RDY = ConRO:AbilityReady(Ability.GrimoireFelguard, timeShift);
	local _Guillotine, _Guillotine_RDY = ConRO:AbilityReady(Ability.Guillotine, timeShift);
	local _HandofGuldan, _HandofGuldan_RDY = ConRO:AbilityReady(Ability.HandofGuldan, timeShift);
	local _Implosion, _Implosion_RDY = ConRO:AbilityReady(Ability.Implosion, timeShift);
	local _PowerSiphon, _PowerSiphon_RDY = ConRO:AbilityReady(Ability.PowerSiphon, timeShift);
	local _ShadowBolt, _ShadowBolt_RDY = ConRO:AbilityReady(Ability.ShadowBolt, timeShift);
		local _DemonicCalling_BUFF = ConRO:Aura(Buff.DemonicCalling, timeShift);
	local _SummonDemonicTyrant, _SummonDemonicTyrant_RDY, _SummonDemonicTyrant_CD = ConRO:AbilityReady(Ability.SummonDemonicTyrant, timeShift);
	local _SummonFelguard, _SummonFelguard_RDY = ConRO:AbilityReady(Ability.SummonDemon.Felguard, timeShift);
	local _SummonVilefiend, _SummonVilefiend_RDY, _SummonVilefiend_CD = ConRO:AbilityReady(Ability.SummonVilefiend, timeShift);

	local _AxeToss, _AxeToss_RDY = ConRO:AbilityReady(Pet_Ability.AxeToss, timeShift, 'pet');
	local _AxeTossCD = ConRO:AbilityReady(Ability.CommandDemon.AxeToss, timeShift);
	local _DevourMagic, _DevourMagic_RDY = ConRO:AbilityReady(Pet_Ability.DevourMagic, timeShift, 'pet');
	local _Felstorm, _Felstorm_RDY, _Felstorm_CD = ConRO:AbilityReady(Pet_Ability.Felstorm, timeShift, 'pet');
		local _Felstorm_BUFF = ConRO:UnitAura(Pet_Ability.Felstorm.spellID, timeShift, 'pet');
	local _SoulStrike, _SoulStrike_RDY = ConRO:AbilityReady(Pet_Ability.SoulStrike, timeShift, 'pet');
	local _SpellLock, _SpellLock_RDY = ConRO:AbilityReady(Pet_Ability.SpellLock, timeShift, 'pet');
	local _SpellLockCD = ConRO:AbilityReady(Ability.CommandDemon.SpellLock, timeShift);

--Conditions
	local _CallDreadstalkers_COST = 2;

	if _DemonicCalling_BUFF then
		_CallDreadstalkers_COST = 0;
	end

	if currentSpell == _HandofGuldan then
		_SoulShards = _SoulShards - 3;
	elseif currentSpell == _CallDreadstalkers then
		_SoulShards = _SoulShards - _CallDreadstalkers_COST;
	elseif currentSpell == _SummonVilefiend then
		_SoulShards = _SoulShards - 1;
	elseif currentSpell == _Demonbolt then
		_SoulShards = _SoulShards + 2;
	elseif currentSpell == _ShadowBolt then
		_SoulShards = _SoulShards + 1;
	end

	if ConRO:IsOverride(_ShadowBolt) == Ability.InfernalBolt.spellID then
		_ShadowBolt, _ShadowBolt_RDY = ConRO:AbilityReady(Ability.InfernalBolt, timeShift);
	end

	if ConRO:IsOverride(_HandofGuldan) == Ability.Ruination.spellID then
		_HandofGuldan, _HandofGuldan_RDY = ConRO:AbilityReady(Ability.Ruination, timeShift);
	end

	if tChosen[Ability.MarkofShatug.talentID] then
		_SummonVilefiend, _SummonVilefiend_RDY, _SummonVilefiend_CD = ConRO:AbilityReady(Ability.SummonGloodhound, timeShift);
	end

	if tChosen[Ability.MarkofFharg.talentID] then
		_SummonVilefiend, _SummonVilefiend_RDY, _SummonVilefiend_CD = ConRO:AbilityReady(Ability.SummonCharhound, timeShift);
	end

--Indicators
	ConRO:AbilityInterrupt(_AxeToss, _AxeToss_RDY and ConRO:Interrupt());
	ConRO:AbilityInterrupt(_AxeTossCD, _AxeToss_RDY and ConRO:Interrupt());
	ConRO:AbilityInterrupt(_SpellLock, _SpellLock_RDY and ConRO:Interrupt());
	ConRO:AbilityInterrupt(_SpellLockCD, _SpellLock_RDY and ConRO:Interrupt());
	ConRO:AbilityPurge(_DevourMagic, _DevourMagic_RDY and ConRO:Purgable());
	ConRO:AbilityPurge(_ArcaneTorrent, _ArcaneTorrent_RDY and _target_in_melee and ConRO:Purgable());

	ConRO:AbilityBurst(_DemonicStrength, _DemonicStrength_RDY and not _Felstorm_BUFF and ConRO:BurstMode(_DemonicStrength));
	ConRO:AbilityBurst(_GrimoireFelguard, _GrimoireFelguard_RDY and _SoulShards >= 1 and ConRO:BurstMode(_GrimoireFelguard));
	ConRO:AbilityBurst(_Guillotine, _Guillotine_RDY and ConRO:BurstMode(_Guillotine));
	ConRO:AbilityBurst(_SummonDemonicTyrant, _SummonDemonicTyrant_RDY and currentSpell ~= _SummonDemonicTyrant and ConRO:ImpsOut() >= 9 and ConRO:BurstMode(_SummonDemonicTyrant));

--Warnings
	ConRO:Warnings("Summon your Felguard!", not _Pet_summoned);

--Rotations
	repeat
		while(true) do
			if not _in_combat then
				if _PowerSiphon_RDY and _DemonicCore_COUNT <= 2 and ConRO:ImpsOut() >= 2 then
					tinsert(ConRO.SuggestedSpells, _PowerSiphon);
					_PowerSiphon_RDY = false;
					_DemonicCore_COUNT = _DemonicCore_COUNT + 2;
					_Queue = _Queue + 1;
					break;
				end

				if _ShadowBolt_RDY and _SoulShards <= 4 and currentSpell ~= _Demonbolt and currentSpell ~= _ShadowBolt then
					tinsert(ConRO.SuggestedSpells, _ShadowBolt);
					_ShadowBolt_RDY = false;
					_SoulShards = _SoulShards + 1;
					_Queue = _Queue + 1;
					break;
				end
			end

			if (not tChosen[Ability.SummonVilefiend.talentID] and (_CallDreadstalkers_CD <= 13 and _CallDreadstalkers_CD >=10)) or (tChosen[Ability.SummonVilefiend.talentID] and (_SummonVilefiend_CD <= 20 and _SummonVilefiend_CD >= 17)) then
				if _SummonDemonicTyrant_RDY and currentSpell ~= _SummonDemonicTyrant and ConRO:FullMode(_SummonDemonicTyrant) then
					tinsert(ConRO.SuggestedSpells, _SummonDemonicTyrant);
					_SummonDemonicTyrant_RDY = false;
					_Queue = _Queue + 1;
					break;
				end
			end

			if _GrimoireFelguard_RDY and _SoulShards >= 1 and _SummonDemonicTyrant_RDY and ConRO:FullMode(_GrimoireFelguard) then
				tinsert(ConRO.SuggestedSpells, _GrimoireFelguard);
				_GrimoireFelguard_RDY = false;
				_SoulShards = _SoulShards - 1;
				_Queue = _Queue + 1;
				break;
			end

			if _SummonVilefiend_RDY and _SoulShards >= 1 and (_SummonDemonicTyrant_RDY or _SummonDemonicTyrant_CD >= 30) and currentSpell ~= _SummonVilefiend then
				tinsert(ConRO.SuggestedSpells, _SummonVilefiend);
				_SoulShards = _SoulShards - 1;
				_SummonVilefiend_RDY = false;
				_Queue = _Queue + 1;
				break;
			end

			if _DemonicStrength_RDY and not _Felstorm_BUFF and ConRO:FullMode(_DemonicStrength) then
				tinsert(ConRO.SuggestedSpells, _DemonicStrength);
				_DemonicStrength_RDY = false;
				_Queue = _Queue + 1;
				break;
			end

			if _Guillotine_RDY and ConRO:FullMode(_Guillotine) then
				tinsert(ConRO.SuggestedSpells, _Guillotine);
				_Guillotine_RDY = false;
				_Queue = _Queue + 1;
				break;
			end

			if _BilescourgeBombers_RDY then
				tinsert(ConRO.SuggestedSpells, _BilescourgeBombers);
				_BilescourgeBombers_RDY = false;
				_Queue = _Queue + 1;
				break;
			end

			if _CallDreadstalkers_RDY and _SoulShards >= _CallDreadstalkers_COST and currentSpell ~= _CallDreadstalkers then
				tinsert(ConRO.SuggestedSpells, _CallDreadstalkers);
				_CallDreadstalkers_RDY = false;
				_SoulShards = _SoulShards - _CallDreadstalkers_COST;
				_Queue = _Queue + 1;
				break;
			end

			if _HandofGuldan_RDY and _SoulShards >= 4 and currentSpell ~= _HandofGuldan then
				tinsert(ConRO.SuggestedSpells, _HandofGuldan);
				_SoulShards = _SoulShards - 3;
				_Queue = _Queue + 1;
				break;
			end

			if _HandofGuldan_RDY and _SoulShards >= 2 and currentSpell ~= _HandofGuldan and ConRO:IsOverride(_ShadowBolt) == Ability.InfernalBolt.spellID then
				tinsert(ConRO.SuggestedSpells, _HandofGuldan);
				_SoulShards = _SoulShards - 3;
				_Queue = _Queue + 1;
				break;
			end

			if _Implosion_RDY and ((ConRO:ImpsOut() >= 6 and _DemonicCore_COUNT <= 0) or ConRO:ImpsOut() >= 9) and ((ConRO_AutoButton:IsVisible() and _enemies_in_40yrds >= 2) or ConRO_AoEButton:IsVisible()) then
				tinsert(ConRO.SuggestedSpells, _Implosion);
				_Implosion_RDY = false;
				_Queue = _Queue + 1;
				break;
			end

			if _Demonbolt_RDY and (_DemonicCore_COUNT >= 2 or (_DemonicCore_DUR <= 2 and _DemonicCore_COUNT >= 1)) then
				tinsert(ConRO.SuggestedSpells, _Demonbolt);
				_DemonicCore_COUNT = _DemonicCore_COUNT - 1;
				_SoulShards = _SoulShards + 2;
				_Queue = _Queue + 1;
				break;
			end

			if _PowerSiphon_RDY and _DemonicCore_COUNT <= 2 and ConRO:ImpsOut() >= 2 then
				tinsert(ConRO.SuggestedSpells, _PowerSiphon);
				_PowerSiphon_RDY = false;
				_DemonicCore_COUNT = _DemonicCore_COUNT + 2;
				_Queue = _Queue + 1;
				break;
			end

			if _HandofGuldan_RDY and _SoulShards >= 3 then
				tinsert(ConRO.SuggestedSpells, _HandofGuldan);
				_SoulShards = _SoulShards - 3;
				_Queue = _Queue + 1;
				break;
			end

			if _ShadowBolt_RDY and _SoulShards <= 4 then
				tinsert(ConRO.SuggestedSpells, _ShadowBolt);
				_SoulShards = _SoulShards + 1;
				_Queue = _Queue + 1;
				break;
			end

			tinsert(ConRO.SuggestedSpells, 289603); --Waiting Spell Icon
			_Queue = _Queue + 3;
			break;
		end
	until _Queue >= 3;
	return nil;
end

function ConRO.Warlock.DemonologyDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
	wipe(ConRO.SuggestedDefSpells);
	ConRO:Stats();

--Abilities
	local _CreateHealthstone, _CreateHealthstone_RDY = ConRO:AbilityReady(Ability.Healthstone.Create, timeShift);
		local _Healthstone, _Healthstone_RDY, _, _, _Healthstone_COUNT = ConRO:ItemReady(Ability.Healthstone.Use, timeShift);
	local _DrainLife, _DrainLife_RDY = ConRO:AbilityReady(Ability.DrainLife, timeShift);
	local _HealthFunnel, _HealthFunnel_RDY = ConRO:AbilityReady(Ability.HealthFunnel, timeShift);
	local _UnendingResolve, _UnendingResolve_RDY = ConRO:AbilityReady(Ability.UnendingResolve, timeShift);

	local _DarkPact, _DarkPact_RDY = ConRO:AbilityReady(Ability.DarkPact, timeShift);
	local _MortalCoil, _MortalCoil_RDY = ConRO:AbilityReady(Ability.MortalCoil, timeShift);

--Conditions
	if tChosen[Ability.PactofGluttony.talentID] then
		_Healthstone, _Healthstone_RDY, _, _, _Healthstone_COUNT = ConRO:ItemReady(Ability.DemonicHealthstone.spellID, timeShift);
	end

--Rotations	
	if _CreateHealthstone_RDY and not _in_combat and _Healthstone_COUNT <= 0 then
		tinsert(ConRO.SuggestedDefSpells, _CreateHealthstone);
	end

	if _DrainLife_RDY and _Player_Percent_Health <= 60 then
		tinsert(ConRO.SuggestedDefSpells, _DrainLife);
	end

	if _MortalCoil_RDY and _Player_Percent_Health <= 80 then
		tinsert(ConRO.SuggestedDefSpells, _MortalCoil);
	end

	if _HealthFunnel_RDY and _Pet_summoned and _Pet_Percent_Health <= 50 then
		tinsert(ConRO.SuggestedDefSpells, _HealthFunnel);
	end

	if _Healthstone_RDY and _Player_Percent_Health <= 50 then
		tinsert(ConRO.SuggestedDefSpells, _Healthstone);
	end

	if _DarkPact_RDY then
		tinsert(ConRO.SuggestedDefSpells, _DarkPact);
	end

	if _UnendingResolve_RDY then
		tinsert(ConRO.SuggestedDefSpells, _UnendingResolve);
	end
	return nil;
end

function ConRO.Warlock.Destruction(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
	wipe(ConRO.SuggestedSpells);
	ConRO:Stats();

--Abilities	
	local _Cataclysm, _Cataclysm_RDY = ConRO:AbilityReady(Ability.Cataclysm, timeShift);
	local _ChannelDemonfire, _ChannelDemonfire_RDY = ConRO:AbilityReady(Ability.ChannelDemonfire, timeShift);
	local _ChaosBolt, _ChaosBolt_RDY = ConRO:AbilityReady(Ability.ChaosBolt, timeShift);
		local _Eradication_DEBUFF =ConRO:TargetAura(Debuff.Eradication, timeShift);
		local _RitualofRuin_BUFF = ConRO:Aura(Buff.RitualofRuin, timeShift);
	local _Conflagrate, _Conflagrate_RDY = ConRO:AbilityReady(Ability.Conflagrate, timeShift);
		local _Conflagrate_CHARGES, _Conflagrate_MaxCHARGES, _Conflagrate_CCD = ConRO:SpellCharges(_Conflagrate);
		local _Conflagrate_DEBUFF = ConRO:TargetAura(Debuff.Conflagrate, timeShift);
		local _BackDraft_BUFF, _BackDraft_COUNT = ConRO:Aura(Buff.BackDraft, timeShift);
	local _DimensionalRift, _DimensionalRift_RDY = ConRO:AbilityReady(Ability.DimensionalRift, timeShift);
		local _DimensionalRift_CHARGES, _DimensionalRift_MaxCHARGES, _DimensionalRift_CCD = ConRO:SpellCharges(_DimensionalRift);
	local _GrimoireofSacrifice, _GrimoireofSacrifice_RDY = ConRO:AbilityReady(Ability.GrimoireofSacrifice, timeShift);
		local _GrimoireofSacrifice_BUFF = ConRO:Aura(Buff.GrimoireofSacrifice, timeShift);
	local _Havoc, _Havoc_RDY, _Havoc_CD = ConRO:AbilityReady(Ability.Havoc, timeShift);
		local _Havoc_Target_DEBUFF = ConRO:TargetAura(Debuff.Havoc, timeShift);
		local _Havoc_DEBUFF = ConRO:AnyTargetAura(Debuff.Havoc);
	local _Immolate, _Immolate_RDY = ConRO:AbilityReady(Ability.Immolate, timeShift);
		local _Immolate_DEBUFF = ConRO:TargetAura(Debuff.Immolate, timeShift);
	local _Incinerate = ConRO:AbilityReady(Ability.Incinerate, timeShift);
		local _Incinerate_RDY = true;
	local _Malevolence, _Malevolence_RDY = ConRO:AbilityReady(Ability.Malevolence, timeShift);
	local _RainofFire, _RainofFire_RDY = ConRO:AbilityReady(Ability.RainofFire, timeShift);
	local _Shadowburn, _Shadowburn_RDY = ConRO:AbilityReady(Ability.Shadowburn, timeShift);
		local _Shadowburn_CHARGES = ConRO:SpellCharges(_Shadowburn);
	local _SoulFire, _SoulFire_RDY = ConRO:AbilityReady(Ability.SoulFire, timeShift);
	local _SummonInfernal, _SummonInfernal_RDY, _SummonInfernal_CD = ConRO:AbilityReady(Ability.SummonInfernal, timeShift);
	local _SummonImp, _SummonImp_RDY = ConRO:AbilityReady(Ability.SummonDemon.Imp, timeShift);

	local _SpellLockCD = ConRO:AbilityReady(Ability.CommandDemon.SpellLock, timeShift);
	local _SpellLock, _SpellLock_RDY = ConRO:AbilityReady(Pet_Ability.SpellLock, timeShift, 'pet');
	local _DevourMagic, _DevourMagic_RDY = ConRO:AbilityReady(Pet_Ability.DevourMagic, timeShift, 'pet');

	local _Void_out = IsSpellKnown(Pet_Ability.ThreateningPresence.spellID, true);

--Conditions
	if currentSpell == _ChaosBolt then
		_SoulShards = _SoulShards - 2;
		_BackDraft_COUNT = _BackDraft_COUNT - 1;
	elseif currentSpell == _Incinerate then
		if tChosen[Ability.DiabolicEmbers.talentID] then
			_SoulShards = _SoulShards + 0.4;
		else
			_SoulShards = _SoulShards + 0.2;
		end
		_BackDraft_COUNT = _BackDraft_COUNT - 1;
	elseif currentSpell == _SoulFire then
		_SoulShards = _SoulShards + 1;
		_BackDraft_COUNT = _BackDraft_COUNT - 1;
	end

	local _RainofFire_COST = 3;
	if tChosen[Ability.Inferno.talentID] then
		_RainofFire_COST = 2;
	end

	if ConRO:HeroSpec(HeroSpec.Hellcaller) then
		_Immolate, _Immolate_RDY = ConRO:AbilityReady(Ability.Wither, timeShift);
		_Immolate_DEBUFF = ConRO:TargetAura(Debuff.Wither, timeShift);
	end

	if ConRO:IsOverride(_Incinerate) == Ability.InfernalBolt.spellID then
		_Incinerate = ConRO:AbilityReady(Ability.InfernalBolt, timeShift);
	end

	if ConRO:IsOverride(_ChaosBolt) == Ability.Ruination.spellID then
		_ChaosBolt, _ChaosBolt_RDY = ConRO:AbilityReady(Ability.Ruination, timeShift);
	end

--Indicators
	ConRO:AbilityInterrupt(_SpellLock, _SpellLock_RDY and ConRO:Interrupt());
	ConRO:AbilityInterrupt(_SpellLockCD, _SpellLock_RDY and ConRO:Interrupt());
	ConRO:AbilityPurge(_DevourMagic, _DevourMagic_RDY and ConRO:Purgable());
	ConRO:AbilityPurge(_ArcaneTorrent, _ArcaneTorrent_RDY and _target_in_melee and ConRO:Purgable());

	ConRO:AbilityBurst(_Malevolence, _Malevolence_RDY and ConRO:HeroSpec(HeroSpec.Hellcaller) and _Immolate_DEBUFF and ConRO:BurstMode(_Malevolence, 60));
	ConRO:AbilityBurst(_SummonInfernal, _SummonInfernal_RDY and ConRO:BurstMode(_SummonInfernal));
	ConRO:AbilityBurst(_GrimoireofSacrifice, _GrimoireofSacrifice_RDY and not _GrimoireofSacrifice_BUFF);

--Warnings
	ConRO:Warnings("Attack Non-Havoced target!", _Havoc_Target_DEBUFF);
	ConRO:Warnings("Summon your demon!", not tChosen[Ability.GrimoireofSacrifice.talentID] and not _Pet_summoned);

--Rotations
	repeat
		while(true) do
			if not _in_combat then
				if _SoulFire_RDY and not _Immolate_DEBUFF and currentSpell ~= _SoulFire and ConRO:FullMode(_SoulFire) then
					tinsert(ConRO.SuggestedSpells, _SoulFire);
					_SoulFire_RDY = false;
					_Immolate_DEBUFF = true;
					_SoulShards = _SoulShards + 1;
					_BackDraft_COUNT = _BackDraft_COUNT - 1;
					_Queue = _Queue + 1;
					break;
				end

				if _Incinerate_RDY and not _SoulFire_RDY and currentSpell ~= _SoulFire then
					tinsert(ConRO.SuggestedSpells, _Incinerate);
					_Incinerate_RDY = false;
					if tChosen[Ability.DiabolicEmbers.talentID] then
						_SoulShards = _SoulShards + 0.4;
					else
						_SoulShards = _SoulShards + 0.2;
					end
					_BackDraft_COUNT = _BackDraft_COUNT - 1;
					_Queue = _Queue + 1;
					break;
				end

				if not _Immolate_DEBUFF and currentSpell ~= _SoulFire and currentSpell ~= _Cataclysm and currentSpell ~= _Immolate then
					tinsert(ConRO.SuggestedSpells, _Immolate);
					_Immolate_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end
			end

			if _SummonInfernal_RDY and ConRO:FullMode(_SummonInfernal) then
				tinsert(ConRO.SuggestedSpells, _SummonInfernal);
				_SummonInfernal_RDY = false;
				_Queue = _Queue + 1;
				break;
			end

			if (ConRO_AutoButton:IsVisible() and _enemies_in_40yrds >= 3 or (ConRO_AoEButton:IsVisible())) then
				if _Cataclysm_RDY and not _Immolate_DEBUFF and currentSpell ~= _SoulFire and currentSpell ~= _Cataclysm and currentSpell ~= _Immolate and not _is_moving then
					tinsert(ConRO.SuggestedSpells, _Cataclysm);
					_Cataclysm_RDY = false;
					_Immolate_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if not _Immolate_DEBUFF and currentSpell ~= _SoulFire and currentSpell ~= _Cataclysm and currentSpell ~= _Immolate and not _is_moving then
					tinsert(ConRO.SuggestedSpells, _Immolate);
					_Immolate_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if _Malevolence_RDY and ConRO:HeroSpec(HeroSpec.Hellcaller) and _Immolate_DEBUFF and ConRO:FullMode(_Malevolence, 60) then
					tinsert(ConRO.SuggestedSpells, _Malevolence);
					_Malevolence_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if _Havoc_RDY and not _Havoc_DEBUFF and (ConRO_AutoButton:IsVisible() and _enemies_in_40yrds >= 2) then
					tinsert(ConRO.SuggestedSpells, _Havoc);
					_Havoc_RDY = false;
					_Havoc_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if _RainofFire_RDY and (_SoulShards >= _RainofFire_COST or _RitualofRuin_BUFF) then
					tinsert(ConRO.SuggestedSpells, _RainofFire);
					if not _RitualofRuin_BUFF then
						_SoulShards = _SoulShards - _RainofFire_COST;
					end
					_RitualofRuin_BUFF = false;
					_Queue = _Queue + 1;
					break;
				end

				if _Shadowburn_RDY and _SoulShards >= 1 and _Shadowburn_CHARGES >= 1 then
					tinsert(ConRO.SuggestedSpells, _Shadowburn);
					_Shadowburn_CHARGES = _Shadowburn_CHARGES - 1;
					_SoulShards = _SoulShards - 1;
					_Queue = _Queue + 1;
					break;
				end

				if _ChannelDemonfire_RDY and _Immolate_DEBUFF and not _is_moving then
					tinsert(ConRO.SuggestedSpells, _ChannelDemonfire);
					_ChannelDemonfire_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if _Conflagrate_RDY and _Conflagrate_CHARGES >= 1 and _BackDraft_COUNT < 2 then
					tinsert(ConRO.SuggestedSpells, _Conflagrate);
					_Conflagrate_CHARGES = _Conflagrate_CHARGES - 1;
					_SoulShards = _SoulShards + 0.5;
					_Queue = _Queue + 1;
					break;
				end

				if _DimensionalRift_RDY and (_DimensionalRift_CHARGES >= _DimensionalRift_MaxCHARGES or (_DimensionalRift_CHARGES >= _DimensionalRift_MaxCHARGES - 1 and _DimensionalRift_CCD <= 3) or (_DimensionalRift_CHARGES >= 1 and _is_moving)) then
					tinsert(ConRO.SuggestedSpells, _DimensionalRift);
					_DimensionalRift_CHARGES = _DimensionalRift_CHARGES - 1;
					_SoulShards = _SoulShards + 0.3;
					_Queue = _Queue + 1;
					break;
				end

				if _Incinerate_RDY then
					tinsert(ConRO.SuggestedSpells, _Incinerate);
					if tChosen[Ability.DiabolicEmbers.talentID] then
						_SoulShards = _SoulShards + 0.4;
					else
						_SoulShards = _SoulShards + 0.2;
					end
					_BackDraft_COUNT = _BackDraft_COUNT - 1;
					_Queue = _Queue + 1;
					break;
				end
			else
				if not _Immolate_DEBUFF and currentSpell ~= _SoulFire and currentSpell ~= _Cataclysm and currentSpell ~= _Immolate and currentSpell ~= _SoulFire then
					tinsert(ConRO.SuggestedSpells, _Immolate);
					_Immolate_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if _Malevolence_RDY and ConRO:HeroSpec(HeroSpec.Hellcaller) and _Immolate_DEBUFF and ConRO:FullMode(_Malevolence, 60) then
					tinsert(ConRO.SuggestedSpells, _Malevolence);
					_Malevolence_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if _Havoc_RDY and not _Havoc_DEBUFF and (ConRO_AutoButton:IsVisible() and _enemies_in_40yrds >= 2) then
					tinsert(ConRO.SuggestedSpells, _Havoc);
					_Havoc_RDY = false;
					_Havoc_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if _Shadowburn_RDY and _SoulShards >= 1 and _Shadowburn_CHARGES >= 1 then
					tinsert(ConRO.SuggestedSpells, _Shadowburn);
					_Shadowburn_CHARGES = _Shadowburn_CHARGES - 1;
					_SoulShards = _SoulShards - 1;
					_Queue = _Queue + 1;
					break;
				end

				if _ChaosBolt_RDY and _SoulShards >= 4.5 and currentSpell ~= _ChaosBolt and not _is_moving then
					tinsert(ConRO.SuggestedSpells, _ChaosBolt);
					if not _RitualofRuin_BUFF then
						_SoulShards = _SoulShards - 2;
					end
					_RitualofRuin_BUFF = false;
					_BackDraft_COUNT = _BackDraft_COUNT - 1;
					_Queue = _Queue + 1;
					break;
				end

				if _SoulFire_RDY and _SoulShards <= 4 and currentSpell ~= _SoulFire and not _is_moving and ConRO:FullMode(_SoulFire) then
					tinsert(ConRO.SuggestedSpells, _SoulFire);
					_SoulFire_RDY = false;
					_Immolate_DEBUFF = true;
					_SoulShards = _SoulShards + 1;
					_BackDraft_COUNT = _BackDraft_COUNT - 1;
					_Queue = _Queue + 1;
					break;
				end

				if _Conflagrate_RDY and (_Conflagrate_CHARGES >= _Conflagrate_MaxCHARGES or (_Conflagrate_CHARGES >= _Conflagrate_MaxCHARGES - 1 and _Conflagrate_CCD <= 2)) then
					tinsert(ConRO.SuggestedSpells, _Conflagrate);
					_Conflagrate_CHARGES = _Conflagrate_CHARGES - 1;
					_SoulShards = _SoulShards + 0.5;
					_Queue = _Queue + 1;
					break;
				end

				if _ChaosBolt_RDY and (_SoulShards >= 2 or _RitualofRuin_BUFF) and tChosen[Ability.Eradication.talentID] and not _Eradication_DEBUFF and currentSpell ~= _ChaosBolt and not _is_moving then
					tinsert(ConRO.SuggestedSpells, _ChaosBolt);
					if not _RitualofRuin_BUFF then
						_SoulShards = _SoulShards - 2;
					end
					_RitualofRuin_BUFF = false;
					_Eradication_DEBUFF = true;
					_BackDraft_COUNT = _BackDraft_COUNT - 1;
					_Queue = _Queue + 1;
					break;
				end

				if _DimensionalRift_RDY and (_DimensionalRift_CHARGES >= _DimensionalRift_MaxCHARGES or (_DimensionalRift_CHARGES >= _DimensionalRift_MaxCHARGES - 1 and _DimensionalRift_CCD <= 3) or (_DimensionalRift_CHARGES >= 1 and _is_moving)) then
					tinsert(ConRO.SuggestedSpells, _DimensionalRift);
					_DimensionalRift_CHARGES = _DimensionalRift_CHARGES - 1;
					_SoulShards = _SoulShards + 0.3;
					_Queue = _Queue + 1;
					break;
				end

				if _Cataclysm_RDY and not _Immolate_DEBUFF and currentSpell ~= _SoulFire and currentSpell ~= _Cataclysm and currentSpell ~= _Immolate and not _is_moving then
					tinsert(ConRO.SuggestedSpells, _Cataclysm);
					_Cataclysm_RDY = false;
					_Immolate_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if not _Immolate_DEBUFF and currentSpell ~= _SoulFire and currentSpell ~= _Cataclysm and currentSpell ~= _Immolate and not _is_moving then
					tinsert(ConRO.SuggestedSpells, _Immolate);
					_Immolate_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if _ChannelDemonfire_RDY and _Immolate_DEBUFF and _Conflagrate_DEBUFF then
					tinsert(ConRO.SuggestedSpells, _ChannelDemonfire);
					_ChannelDemonfire_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if _Conflagrate_RDY and _Conflagrate_CHARGES >= 1 and (not tChosen[Ability.RoaringBlaze.talentID] or (tChosen[Ability.RoaringBlaze.talentID] and not _Conflagrate_DEBUFF)) then
					tinsert(ConRO.SuggestedSpells, _Conflagrate);
					_Conflagrate_CHARGES = _Conflagrate_CHARGES - 1;
					_SoulShards = _SoulShards + 0.5;
					_Queue = _Queue + 1;
					break;
				end

				if _Incinerate_RDY then
					tinsert(ConRO.SuggestedSpells, _Incinerate);
					if tChosen[Ability.DiabolicEmbers.talentID] then
						_SoulShards = _SoulShards + 0.4;
					else
						_SoulShards = _SoulShards + 0.2;
					end
					_BackDraft_COUNT = _BackDraft_COUNT - 1;
					_Queue = _Queue + 1;
					break;
				end
			end

			tinsert(ConRO.SuggestedSpells, 289603); --Waiting Spell Icon
			_Queue = _Queue + 3;
			break;
		end
	until _Queue >= 3;
	return nil;
end

function ConRO.Warlock.DestructionDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
	wipe(ConRO.SuggestedDefSpells);
	ConRO:Stats();

--Abilities
	local _CreateHealthstone, _CreateHealthstone_RDY = ConRO:AbilityReady(Ability.Healthstone.Create, timeShift);
		local _Healthstone, _Healthstone_RDY, _, _, _Healthstone_COUNT = ConRO:ItemReady(Ability.Healthstone.Use, timeShift);
	local _DrainLife, _DrainLife_RDY = ConRO:AbilityReady(Ability.DrainLife, timeShift);
	local _HealthFunnel, _HealthFunnel_RDY = ConRO:AbilityReady(Ability.HealthFunnel, timeShift);
	local _UnendingResolve, _UnendingResolve_RDY = ConRO:AbilityReady(Ability.UnendingResolve, timeShift);

	local _DarkPact, _DarkPact_RDY = ConRO:AbilityReady(Ability.DarkPact, timeShift);
	local _MortalCoil, _MortalCoil_RDY = ConRO:AbilityReady(Ability.MortalCoil, timeShift);

--Conditions
	if tChosen[Ability.PactofGluttony.talentID] then
		_Healthstone, _Healthstone_RDY, _, _, _Healthstone_COUNT = ConRO:ItemReady(Ability.DemonicHealthstone.spellID, timeShift);
	end

--Rotations	
	if _CreateHealthstone_RDY and not _in_combat and _Healthstone_COUNT <= 0 then
		tinsert(ConRO.SuggestedDefSpells, _CreateHealthstone);
	end

	if _DrainLife_RDY and _Player_Percent_Health <= 60 then
		tinsert(ConRO.SuggestedDefSpells, _DrainLife);
	end

	if _MortalCoil_RDY and _Player_Percent_Health <= 80 then
		tinsert(ConRO.SuggestedDefSpells, _MortalCoil);
	end

	if _HealthFunnel_RDY and _Pet_summoned and _Pet_Percent_Health <= 50 then
		tinsert(ConRO.SuggestedDefSpells, _HealthFunnel);
	end

	if _Healthstone_RDY and _Player_Percent_Health <= 50 then
		tinsert(ConRO.SuggestedDefSpells, _Healthstone);
	end

	if _DarkPact_RDY then
		tinsert(ConRO.SuggestedDefSpells, _DarkPact);
	end

	if _UnendingResolve_RDY then
		tinsert(ConRO.SuggestedDefSpells, _UnendingResolve);
	end
	return nil;
end

ConRO.DemonCount = {};
ConRO.ImpCount = {};
ConRO.BasicDemons = { --[demon] = duration (0 to blacklist)
							[688] = 0,     --Imp
							[697] = 0,     --Voidwalker
							[691] = 0,     --Felhunter
							[712] = 0,     --Succubus
							[30146] = 0,   --Felguard
							[112866] = 0,  --Fel Imp
							[112867] = 0,  --Voidlord
							[112869] = 0,  --Observer
							[112868] = 0,  --Shivarra
							[112870] = 0,  --Wrathguard
							[240263] = 0,  --Fel Succubus
							[240266] = 0,  --Shadow Succubus
							[104317] = 0,  --Wild Imps, counted by other means
							[111898] = 15, --Grimoire: Felguard
							[193331] = 12, --Dreadstalker 1
							[193332] = 12, --Dreadstalker 2
							[265187] = 15, --Demonic Tyrant
							[264119] = 15  --Vilefiend
						};

function ConRO:COMBAT_LOG_EVENT_UNFILTERED()
	local _, subevent, _, sourceGUID, _, _, _, destGUID, destName, _, _, spellID = CombatLogGetCurrentEventInfo();
	local myGUID = UnitGUID("player");

	local ImpMaxCasts = 5;
	local ImpMaxTime = 20; --seconds
	local TyrantDuration = 15; --seconds
	local TyrantStart = 0;
	local TyrantActive = false;


		--Imps are summoned
		if subevent == "SPELL_SUMMON" and sourceGUID == myGUID and (spellID == 104317 or spellID == 279910) then

			local tyrantExtra = TyrantActive and TyrantDuration - (GetTime() - TyrantStart) or 0

			ConRO.ImpCount[destGUID] = {ImpMaxCasts, GetTime() + ImpMaxTime + tyrantExtra - 0.1}
			C_Timer.After(ImpMaxTime + tyrantExtra, function()

					for k in pairs(ConRO.ImpCount) do
						if GetTime() > ConRO.ImpCount[k][2] then
							ConRO.ImpCount[k] = nil
						end
					end
			end)
		end

		--Imps succesfully consume energy
		if subevent == "SPELL_CAST_SUCCESS" and ConRO.ImpCount[sourceGUID] and not TyrantActive then
			if ConRO.ImpCount[sourceGUID][1] == 1 then
				ConRO.ImpCount[sourceGUID] = nil
			else
				ConRO.ImpCount[sourceGUID][1] = ConRO.ImpCount[sourceGUID][1] - 1
			end
		end

		--Summon Demonic Tyrant
		if subevent == "SPELL_CAST_SUCCESS" and sourceGUID == myGUID and spellID == 265187 then
			local remains

			TyrantActive = true
			TyrantStart = GetTime()

			C_Timer.After(TyrantDuration, function()
					TyrantActive = false

					for k in pairs(ConRO.ImpCount) do
						if GetTime() > ConRO.ImpCount[k][2] then
							ConRO.ImpCount[k] = nil
						end
					end
			end)

			for k in pairs(ConRO.ImpCount) do
				remains = ConRO.ImpCount[k][2] - GetTime()
				ConRO.ImpCount[k][2] = ConRO.ImpCount[k][2] + TyrantDuration - 0.1

				C_Timer.After(TyrantDuration + remains, function()
						for k in pairs(ConRO.ImpCount) do
							if GetTime() > ConRO.ImpCount[k][2] then
								ConRO.ImpCount[k] = nil
							end
						end
				end)
			end
		end

		--Implosion
		if subevent == "SPELL_CAST_SUCCESS" and sourceGUID == myGUID and spellID == 196277 then
			wipe(ConRO.ImpCount)
		end

		--Power Siphon
		if subevent == "SPELL_CAST_SUCCESS" and sourceGUID == myGUID and spellID == 264130 then
			local oldest, oldestTime = "", 2*GetTime()
			for i = 1, 2 do
				for name, imp in pairs(ConRO.ImpCount) do
					oldestTime = math.min(imp[2], oldestTime)

					if imp[2] == oldestTime then
						oldest = name
					end
				end

				oldestTime = oldestTime*2
				ConRO.ImpCount[oldest] = nil
			end
		end

		--Death
		if subevent == "UNIT_DIED" or subevent == "SPELL_INSTAKILL" or subevent == "UNIT_DESTROYED" then
			if ConRO.ImpCount[destGUID] then
				ConRO.ImpCount[destGUID] = nil
			elseif destGUID == myGUID then
				wipe(ConRO.ImpCount)
			end
		end
	return true;
end

function ConRO:ImpsOut()
  local count = 0
	for k in pairs(ConRO.ImpCount) do
		if k ~= nil then
			if k then
				count = count + 1;
			end
		else
			break;
		end
	end
	--print("Imp Count: " .. count);
	return count;
end