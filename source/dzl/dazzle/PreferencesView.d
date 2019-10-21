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
module dazzle.PreferencesView;

private import dazzle.PreferencesIF;
private import dazzle.PreferencesT;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.Bin;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.Widget;


/** */
public class PreferencesView : Bin, PreferencesIF
{
	/** the main Gtk struct */
	protected DzlPreferencesView* dzlPreferencesView;

	/** Get the main Gtk struct */
	public DzlPreferencesView* getPreferencesViewStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlPreferencesView;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlPreferencesView;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlPreferencesView* dzlPreferencesView, bool ownedRef = false)
	{
		this.dzlPreferencesView = dzlPreferencesView;
		super(cast(GtkBin*)dzlPreferencesView, ownedRef);
	}

	// add the Preferences capabilities
	mixin PreferencesT!(DzlPreferencesView);


	/** */
	public static GType getType()
	{
		return dzl_preferences_view_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_preferences_view_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlPreferencesView*) p);
	}

	/** */
	public bool getShowSearchEntry()
	{
		return dzl_preferences_view_get_show_search_entry(dzlPreferencesView) != 0;
	}

	/** */
	public bool getUseSidebar()
	{
		return dzl_preferences_view_get_use_sidebar(dzlPreferencesView) != 0;
	}

	/** */
	public void reapplyFilter()
	{
		dzl_preferences_view_reapply_filter(dzlPreferencesView);
	}

	/** */
	public void setShowSearchEntry(bool showSearchEntry)
	{
		dzl_preferences_view_set_show_search_entry(dzlPreferencesView, showSearchEntry);
	}

	/** */
	public void setUseSidebar(bool useSidebar)
	{
		dzl_preferences_view_set_use_sidebar(dzlPreferencesView, useSidebar);
	}
}
