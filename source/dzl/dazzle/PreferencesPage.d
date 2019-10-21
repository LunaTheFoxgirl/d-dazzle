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
module dazzle.PreferencesPage;

private import dazzle.PatternSpec;
private import dazzle.PreferencesGroup;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.HashTable;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.Bin;
private import gtk.BuildableIF;
private import gtk.BuildableT;


/** */
public class PreferencesPage : Bin
{
	/** the main Gtk struct */
	protected DzlPreferencesPage* dzlPreferencesPage;

	/** Get the main Gtk struct */
	public DzlPreferencesPage* getPreferencesPageStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlPreferencesPage;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlPreferencesPage;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlPreferencesPage* dzlPreferencesPage, bool ownedRef = false)
	{
		this.dzlPreferencesPage = dzlPreferencesPage;
		super(cast(GtkBin*)dzlPreferencesPage, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_preferences_page_get_type();
	}

	/** */
	public void addGroup(PreferencesGroup group)
	{
		dzl_preferences_page_add_group(dzlPreferencesPage, (group is null) ? null : group.getPreferencesGroupStruct());
	}

	/**
	 * Returns: An #DzlPreferencesGroup or %NULL.
	 */
	public PreferencesGroup getGroup(string groupName)
	{
		auto p = dzl_preferences_page_get_group(dzlPreferencesPage, Str.toStringz(groupName));

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PreferencesGroup)(cast(DzlPreferencesGroup*) p);
	}

	/** */
	public void refilter(PatternSpec spec)
	{
		dzl_preferences_page_refilter(dzlPreferencesPage, (spec is null) ? null : spec.getPatternSpecStruct());
	}

	/** */
	public void setMap(HashTable map)
	{
		dzl_preferences_page_set_map(dzlPreferencesPage, (map is null) ? null : map.getHashTableStruct());
	}
}
