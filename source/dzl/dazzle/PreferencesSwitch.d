/*
 * This file is part of d-dazzle.
 *
 * d-dazzle is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * d-dazzle is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with d-dazzle; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */
module dazzle.PreferencesSwitch;

private import dazzle.PreferencesBin;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import gobject.Signals;
private import std.algorithm;


/** */
public class PreferencesSwitch : PreferencesBin
{
	/** the main Gtk struct */
	protected DzlPreferencesSwitch* dzlPreferencesSwitch;

	/** Get the main Gtk struct */
	public DzlPreferencesSwitch* getPreferencesSwitchStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlPreferencesSwitch;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlPreferencesSwitch;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlPreferencesSwitch* dzlPreferencesSwitch, bool ownedRef = false)
	{
		this.dzlPreferencesSwitch = dzlPreferencesSwitch;
		super(cast(DzlPreferencesBin*)dzlPreferencesSwitch, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_preferences_switch_get_type();
	}

	/** */
	gulong addOnActivated(void delegate(PreferencesSwitch) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "activated", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
