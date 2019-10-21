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
module dazzle.PreferencesEntry;

private import dazzle.PreferencesBin;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.Widget;
private import std.algorithm;


/** */
public class PreferencesEntry : PreferencesBin
{
	/** the main Gtk struct */
	protected DzlPreferencesEntry* dzlPreferencesEntry;

	/** Get the main Gtk struct */
	public DzlPreferencesEntry* getPreferencesEntryStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlPreferencesEntry;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlPreferencesEntry;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlPreferencesEntry* dzlPreferencesEntry, bool ownedRef = false)
	{
		this.dzlPreferencesEntry = dzlPreferencesEntry;
		super(cast(DzlPreferencesBin*)dzlPreferencesEntry, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_preferences_entry_get_type();
	}

	/**
	 * Returns: A #GtkWidget
	 */
	public Widget getEntryWidget()
	{
		auto p = dzl_preferences_entry_get_entry_widget(dzlPreferencesEntry);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) p);
	}

	/**
	 * Returns: A #GtkWidget
	 */
	public Widget getTitleWidget()
	{
		auto p = dzl_preferences_entry_get_title_widget(dzlPreferencesEntry);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) p);
	}

	/** */
	gulong addOnActivate(void delegate(PreferencesEntry) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "activate", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnChanged(void delegate(string, PreferencesEntry) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "changed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
