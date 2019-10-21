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
module dazzle.PreferencesFontButton;

private import dazzle.PreferencesBin;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import gobject.Signals;
private import std.algorithm;


/** */
public class PreferencesFontButton : PreferencesBin
{
	/** the main Gtk struct */
	protected DzlPreferencesFontButton* dzlPreferencesFontButton;

	/** Get the main Gtk struct */
	public DzlPreferencesFontButton* getPreferencesFontButtonStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlPreferencesFontButton;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlPreferencesFontButton;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlPreferencesFontButton* dzlPreferencesFontButton, bool ownedRef = false)
	{
		this.dzlPreferencesFontButton = dzlPreferencesFontButton;
		super(cast(DzlPreferencesBin*)dzlPreferencesFontButton, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_preferences_font_button_get_type();
	}

	/** */
	gulong addOnActivate(void delegate(PreferencesFontButton) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "activate", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
