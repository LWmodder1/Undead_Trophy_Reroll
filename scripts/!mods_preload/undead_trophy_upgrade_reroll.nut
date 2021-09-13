::mods_registerMod("mod_undead_trophy_upgrade_reroll", 1.0, "Undead Trophy Upgrade");
::mods_queue("mod_undead_trophy_upgrade_reroll", null, function()
{
    ::mods_hookNewObject("items/accessory/undead_trophy_item", function(o)
	{
		o.getTooltip=function()
		{
			local result = [
				{
					id = 1,
					type = "title",
					text = this.getName()
				},
				{
					id = 2,
					type = "description",
					text = this.getDescription()
				},
			];
			result.push({
				id = 66,
				type = "text",
				text = this.getValueString()
			});

			if (this.getIconLarge() != null)
			{
				result.push({
					id = 3,
					type = "image",
					image = this.getIconLarge(),
					isLarge = true
				});
			}
			else
			{
				result.push({
					id = 3,
					type = "image",
					image = this.getIcon()
				});
			}

			result.push({
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Doubles your Resolve if defending against fear and mind control abilities. Re-roll every failed morale check for a second chance. "
			});
			return result;
		}
	
		o.onUpdateProperties=function(_properties)
		{
			this.accessory.onUpdateProperties(_properties);
			_properties.MoraleCheckBraveryMult[this.Const.MoraleCheckType.MentalAttack] *= 2.0;
			_properties.RerollMoraleChance = 100;
		}
	});

})
