::mods_registerMod("mod_undead_trophy_upgrade_reroll", 1.0, "Undead Trophy Upgrade");
::mods_queue("mod_undead_trophy_upgrade_reroll", null, function()
{
    ::mods_hookNewObject("items/accessory/undead_trophy_item", function(o)
	o.onUpdateProperties=function(_properties)
	{
		this.accessory.onUpdateProperties(_properties);
		_properties.MoraleCheckBraveryMult[this.Const.MoraleCheckType.MentalAttack] *= 2.0;
		_properties.RerollMoraleChance = 100;
	});

})